import Constants from '../../common/Constants'
@Component
export default struct Project {
  build() {
    Column() {
      Text("Project")
    }
    .width(Constants.FULL_PARENT)
    .backgroundColor($r('app.color.mainPage_backgroundColor'))
    .justifyContent(FlexAlign.Center)
  }
}