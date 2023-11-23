import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import { HomeBannerItemBean } from '../../bean/HomeBannerItemBean'
import Constants from '../../common/Constants';
import HomeViewModel from '../../viewmodel/HomeViewModel';

@Component
export default struct Banner {
  @State bannerData: Array<HomeBannerItemBean> = [];
  private swiperController: SwiperController = new SwiperController();

  aboutToAppear() {
    HomeViewModel.getHomeBanner(Constants.GET_HOME_BANNER).then((data: HomeBannerItemBean[]) => {
      this.bannerData = data;
    }).catch((err: string | Resource) => {
      promptAction.showToast({
        message: err,
        duration: Constants.ANIMATION_DURATION
      });
    });
  }

  build() {
    Column() {
      Swiper(this.swiperController) {
        ForEach(this.bannerData, (banner: HomeBannerItemBean) => {
          Image(banner.imagePath).borderRadius($r('app.float.home_swiper_borderRadius')).onClick(() => {
            router.pushUrl({
              url: 'pages/WebPage',
              params: {
                title: banner.title,
                src: banner.url
              }
            }, router.RouterMode.Single)
          })
        }, (img: Resource) => JSON.stringify(img.id))
      }
      .margin({top: $r('app.float.home_swiper_margin')})
      .autoPlay(true)
      .width(Constants.FULL_PARENT)
      .height($r('app.float.main_swiper_height'))
    }
  }
}