import { ArticleItemBean } from './ArticleItemBean'

export class ArticleDataBean {
  datas: Array<ArticleItemBean> = [];
  curPage: number = 0;
  offset: number = 0;
  pageCount: number = 0;
  size: number = 0;
  total: number = 0;
  over: Boolean = false;
}