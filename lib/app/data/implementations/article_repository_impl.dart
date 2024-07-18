import 'dart:convert';

import 'package:fullstack_challenge/app/app_constants.dart';
import 'package:fullstack_challenge/app/domain/models/article.dart';
import 'package:fullstack_challenge/app/domain/models/response.dart';
import 'package:fullstack_challenge/app/domain/repositories/article_repository.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ArticleRepositoryImpl extends ArticleRepository {
  @override
  Future<ResponseE?> postArticle(Article article) async {
    ResponseE? res;
    final uri = Uri.parse("${AppConstants.BASE_URL}/api/v1/articles");

    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "title": "${article.title.toString().capitalizeFirst}",
          "author": "${article.author.toString().capitalizeFirst}",
          "content": "${article.content.toString().capitalizeFirst}"
        }),
      );

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
          if (jsonResponse['msg'] == 'Ok') {
            return ResponseE.success;
          }
        }
      }
    } catch (e) {
      res = ResponseE.error;
      throw FormatException(e.toString());
    }
    return res;
  }

  @override
  Future<List<Article>?> fetchArticles() async {
    List<Article>? list;
    final uri = Uri.parse("${AppConstants.BASE_URL}/api/v1/articles");
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          list = [];
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
          final List listResponse = jsonResponse['data'];

          list.addAll(
            listResponse.map((item) {
              return Article(
                title: item['title'] ?? "null",
                author: item['author'] ?? "null",
                content: item['content'] ?? "null",
                id: item['_id'] ?? "null",
                date: item['createdAt'] ?? "null",
              );
            }),
          );
        }
      }
    } catch (e) {
      throw FormatException(e.toString());
    }

    return list;
  }
}
