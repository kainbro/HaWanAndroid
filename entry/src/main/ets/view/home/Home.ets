import Banner from './Banner'
import ArticleList from './ArticleList'

@Component
export default struct Home {
  build() {
    Stack() {
      ArticleList();
      Banner();
    }.alignContent(Alignment.Top)
  }
}