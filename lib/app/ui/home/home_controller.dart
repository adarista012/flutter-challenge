import 'package:flutter/material.dart';
import 'package:fullstack_challenge/app/domain/models/article.dart';
import 'package:fullstack_challenge/app/domain/repositories/article_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article>? _articles;
  List<Article>? get article => _articles;

  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _authorTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();

  TextEditingController get titleTextController => _titleTextController;
  TextEditingController get authorTextController => _authorTextController;
  TextEditingController get contentTextController => _contentTextController;

  final repository = Get.find<ArticleRepository>();

  HomeController() {
    _init();
  }

  _init() {
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    _updateLoading(true);

    try {
      _articles = await repository.fetchArticles();
    } catch (e) {
      printError(info: e.toString());
    }

    _updateLoading(false);
  }

  _updateLoading(bool newState) {
    _isLoading = newState;
    update();
  }

  void onChangeTitle(String? title) {
    _titleTextController.text = title ?? "";
  }

  void onChangeAuthor(String? author) {
    _authorTextController.text = author ?? "";
  }

  void onChangeContent(String? content) {
    _contentTextController.text = content ?? "";
  }

  void addArticle() async {
    if (_titleTextController.value.text.isNotEmpty &&
        _authorTextController.value.text.isNotEmpty &&
        _contentTextController.value.text.isNotEmpty) {
      Get.back();
      try {
        final response = await repository.postArticle(
          Article(
            title: _titleTextController.value.text,
            author: _authorTextController.value.text,
            content: _contentTextController.value.text,
          ),
        );

        if (response != null) {
          Get.showSnackbar(
            const GetSnackBar(
              message: "Article added",
              backgroundColor: Colors.green,
            ),
          );
        }
        await fetchArticles();
      } catch (e) {
        printError(info: e.toString());
        Get.showSnackbar(
          const GetSnackBar(
            message: "Error adding article",
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
    resetTextControllers();
  }

  void resetTextControllers() {
    _titleTextController.clear();
    _authorTextController.clear();
    _contentTextController.clear();
  }
}
