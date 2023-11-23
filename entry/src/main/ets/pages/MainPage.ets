import Constants from '../common/Constants';
import Home from '../view/home/Home';
import Project from '../view/project/Project';

@Entry
@Component
struct MainPage {
  @State currentTabIndex: number = Constants.HOME_TAB_INDEX;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, index: number, icon: Resource) {
    Column() {
      Image(icon)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
        .fillColor(this.getTabBarColor(index))
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.main_tab_fontSize'))
        .fontColor(this.getTabBarColor(index))
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width(Constants.FULL_PARENT)
    .onClick(() => {
      this.currentTabIndex = index;
      this.tabsController.changeIndex(this.currentTabIndex)
    })
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      // 首页
      TabContent() {
        Home()
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder(Constants.HOME_TITLE, Constants.HOME_TAB_INDEX
        , $r('app.media.ic_bottom_home')))

      // 项目
      TabContent() {
        Project()
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder(Constants.PROJECT_TITLE, Constants.PROJECT_TAB_INDEX
        , $r('app.media.ic_bottom_project')))
    }
    .width(Constants.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight($r('app.float.mainPage_barHeight'))
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentTabIndex = index;
    })
  }

  private getTabBarColor(index: number) {
    return this.currentTabIndex == index
      ? $r('app.color.tab_bar_select_color')
      : $r('app.color.tab_bar_normal_color')
  }
}