import 'package:fullstack_challenge/app/data/implementations/article_repository_impl.dart';
import 'package:fullstack_challenge/app/domain/repositories/article_repository.dart';
import 'package:get/get.dart';

class InjectDependencies {
  static init() {
    Get.lazyPut<ArticleRepository>(() => ArticleRepositoryImpl(), fenix: true);
  }
}
