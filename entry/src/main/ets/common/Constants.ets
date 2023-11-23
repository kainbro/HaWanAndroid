export default class Constants{
  static readonly HOME_TITLE = "首页"
  static readonly PROJECT_TITLE = "项目"

  static readonly HOME_TAB_INDEX = 0
  static readonly PROJECT_TAB_INDEX = 1

  static readonly FULL_PARENT = '100%'
  static readonly COMMON_SPACE = 12
  static readonly BUTTON_WIDTH = '90%'

  static readonly PAGE_SIZE = 20;
  static readonly HTTP_READ_TIMEOUT = 10000;
  static readonly HTTP_CODE_200 = 200;
  static readonly SERVER_CODE_SUCCESS = 0;
  static readonly ANIMATION_DURATION = 2000;
  static readonly LIST_ITEM_TEXT_MAX_LINES = 1;
  static readonly LIST_ITEM_TITLE_MAX_LINES = 3;
  static readonly LIST_ITEM_TITLE_FONT_WEIGHT = 500;
  static readonly LIST_ITEM_PADDING_TOP = '2.4%';
  static readonly LIST_ITEM_PADDING_LEFT = '3.5%';
  static readonly LIST_ITEM_PADDING_RIGHT = '3.5%';
  static readonly LIST_ITEM_BOARD_RADIUS = 16;

  static readonly PAGE_TITLE_TEXT_SIZE = 16;
  static readonly PAGE_TITLE_TEXT_MAX_LINES = 1;
  static readonly PAGE_TITLE_VIEW_HEIGHT = 36;
  static readonly PAGE_TITLE_TEXT_WIDTH = '76%';

  static readonly SERVER: string = 'https://www.wanandroid.com'
  static readonly GET_HOME_ARTICLE_LIST: string = 'article/list'
  static readonly GET_HOME_BANNER: string = 'banner/json'
}

export const enum ContentType {
  JSON = 'application/json'
}