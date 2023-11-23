import { ListView, RefreshController } from '@app/refresh';
import HomeViewModel from '../../viewmodel/HomeViewModel';
import { ArticleItemBean } from '../../bean/ArticleItemBean';
import Constants from '../../common/Constants';
import { ArticleDataBean } from '../../bean/ArticleDataBean';
import promptAction from '@ohos.promptAction';
import ArticleItem from './ArticleItem';

@Component
export default struct ArticleList {
  @State controller: RefreshController = new RefreshController() //刷新控制器
  @State array: Array<number> = []

  @State articleData: Array<ArticleItemBean> = [];
  @State currentPage: number = 1;
  @State pageSize: number = Constants.PAGE_SIZE;
  @State hasMore: Boolean = true;

  aboutToAppear() {
    this.getHomeArticleList(true);
  }

  @Builder
  itemLayout(item, index) {
    ArticleItem({articleData: item})
  }

  getHomeArticleList(reset: boolean) {
    HomeViewModel.getHomeArticleList(this.currentPage, this.pageSize, Constants.GET_HOME_ARTICLE_LIST)
      .then((data: ArticleDataBean) => {
      if (data.curPage < data.pageCount) {
        this.currentPage++;
        this.hasMore = true;
      }  else {
        this.hasMore = false;
      }
      if (reset) {
        this.articleData = data.datas;
      } else {
        this.articleData = this.articleData.concat(data.datas);
      }
    }).catch((err: string | Resource) => {
      promptAction.showToast({ message: err});
    })
  }

  build() {
    ListView({
      items: this.articleData, //数据源 数组
      itemLayout: (item, index) => this.itemLayout(item, index),
      controller: this.controller, //控制器，负责关闭下拉和上拉
      marginHeader: 160,
      onRefresh: () => {
        //下拉刷新
        this.getHomeArticleList(true);
        this.controller.finishRefresh()
      },
      onLoadMore: () => {
        //上拉加载
        this.getHomeArticleList(false);
        this.controller.finishLoadMore()
      }
    })
  }
}