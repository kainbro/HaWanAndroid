export default class ResponseResult {
  errorCode: Number;
  errorMsg: string | Resource;
  data: string | Object | ArrayBuffer;

  constructor() {
    this.errorCode;
    this.errorMsg = '';
    this.data = '';
  }
}