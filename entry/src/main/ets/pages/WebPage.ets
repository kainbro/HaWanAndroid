import router from '@ohos.router';
import web_webview from '@ohos.web.webview'
import Constants from '../common/Constants';

@Entry
@Component
struct WebPage {
  @State src: string = router.getParams()?.['src'];
  @State title: string = router.getParams()?.['title'];

  controller: web_webview.WebviewController = new web_webview.WebviewController();

  build() {
    Column() {
      PageTitle({ titleName: this.title })

      Divider()
        .strokeWidth('1px')
        .color($r('sys.color.ohos_id_color_list_separator'))

      Web({
        src: this.src, controller: this.controller
      }).javaScriptAccess(true)
    }
  }
}

@Component
struct PageTitle {
  private titleName: string

  build() {
    Row() {
      Image($r('app.media.back'))
        .width(20)
        .height(20)
        .onClick(() => {
          router.back()
        })
      Text(this.titleName)
        .fontSize(Constants.PAGE_TITLE_TEXT_SIZE)
        .width(Constants.PAGE_TITLE_TEXT_WIDTH)
        .maxLines(Constants.PAGE_TITLE_TEXT_MAX_LINES)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .margin({ left: 20 })
    }
    .padding(12)
    .width('100%')
  }
}