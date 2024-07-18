import 'package:fullstack_challenge/app/domain/models/article.dart';
import 'package:fullstack_challenge/app/domain/models/response.dart';

abstract class ArticleRepository {
  Future<List<Article>?> fetchArticles();
  Future<ResponseE?> postArticle(Article article);
}
