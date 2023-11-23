import router from '@ohos.router';
import { ArticleItemBean } from '../../bean/ArticleItemBean'
import Constants from '../../common/Constants';

@Component
export default struct ArticleItem {
  private articleData: ArticleItemBean = new ArticleItemBean();

  build() {
    Column() {
      Row() {
        Text(this.articleData.author ? this.articleData.author : this.articleData.shareUser)
          .fontSize($r("app.float.list_item_font_size_2"))
          .fontColor($r('app.color.fontColor_text2'))
          .maxLines(Constants.LIST_ITEM_TEXT_MAX_LINES)
          .textOverflow({overflow: TextOverflow.None})

        Text(this.articleData.niceDate)
          .fontSize($r("app.float.list_item_font_size_2"))
          .fontColor($r('app.color.fontColor_text2'))
          .maxLines(Constants.LIST_ITEM_TEXT_MAX_LINES)
          .margin({right: Constants.LIST_ITEM_PADDING_RIGHT})
          .textOverflow({overflow: TextOverflow.None})
      }
      .width('96%')
      .margin({left: Constants.LIST_ITEM_PADDING_LEFT,
      right: Constants.LIST_ITEM_PADDING_RIGHT,
      top: Constants.LIST_ITEM_PADDING_TOP})
      .justifyContent(FlexAlign.SpaceBetween)

      Text(this.articleData.title)
        .fontSize($r("app.float.list_item_font_size_1"))
        .fontColor($r('app.color.fontColor_text1'))
        .maxLines(Constants.LIST_ITEM_TITLE_MAX_LINES)
        .margin({
          left: Constants.LIST_ITEM_PADDING_LEFT,
          right: Constants.LIST_ITEM_PADDING_RIGHT,
          top: Constants.LIST_ITEM_PADDING_TOP,
          bottom: Constants.LIST_ITEM_PADDING_TOP
        })
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .fontWeight(Constants.LIST_ITEM_TITLE_FONT_WEIGHT)

      Row() {
        Text(this.articleData.superChapterName + '/')
          .fontSize($r('app.float.list_item_font_size_2'))
          .fontColor($r('app.color.fontColor_text2'))
          .maxLines(Constants.LIST_ITEM_TEXT_MAX_LINES)
          .textOverflow({overflow: TextOverflow.None})

        Text(this.articleData.superChapterName)
          .fontSize($r('app.float.list_item_font_size_2'))
          .fontColor($r('app.color.fontColor_text2'))
          .maxLines(Constants.LIST_ITEM_TEXT_MAX_LINES)
          .textOverflow({overflow: TextOverflow.None})
      }
      .margin({ left: Constants.LIST_ITEM_PADDING_LEFT,
      right: Constants.LIST_ITEM_PADDING_LEFT,
      bottom: Constants.LIST_ITEM_PADDING_TOP})
    }
    .backgroundColor($r('app.color.list_item_background'))
    .margin({top: Constants.LIST_ITEM_PADDING_TOP})
    .borderRadius(Constants.LIST_ITEM_BOARD_RADIUS)
    .alignItems(HorizontalAlign.Start)
    .onClick(event => {
      router.pushUrl({
        url: 'pages/WebPage',
        params: {
          title: this.articleData.title,
          src: this.articleData.link
        }
      }, router.RouterMode.Single)
    })
  }
}