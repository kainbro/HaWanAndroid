import { ArticleDataBean } from '../bean/ArticleDataBean'
import Constants from '../common/Constants'
import { httpRequestGet } from '../common/utils/HttpUtil';
import ResponseResult from '../bean/ResponseResult';
import Logger from '../common/utils/Logger';
import { HomeBannerItemBean } from '../bean/HomeBannerItemBean';

class HomeViewModel {
  getHomeArticleList(currentPage: number, pageSize: number, path: string): Promise<ArticleDataBean> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${Constants.SERVER}/${path}/`;
      url += currentPage + '/json' + '?page_size' + pageSize;
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.errorCode === Constants.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('get article failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'))
        }
      }).catch((err: Error) => {
        Logger.error('get article failed', JSON.stringify(err));
        reject($r('app.string.http_error_message'))
      })
    })
  }

  getHomeBanner(path: string): Promise<HomeBannerItemBean[]> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${Constants.SERVER}/${path}/`;
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.errorCode === Constants.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          Logger.error('get banner failed', JSON.stringify(data));
          reject($r('app.string.page_none_msg'))
        }
      }).catch((err: Error) => {
        Logger.error('get banner failed', JSON.stringify(err));
        reject($r('app.string.http_error_message'))
      })
    })
  }

}

let homeViewModel = new HomeViewModel();

export default homeViewModel as HomeViewModel;