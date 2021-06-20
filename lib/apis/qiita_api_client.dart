import 'package:dio/dio.dart';

import 'package:qiita_app_with_riverpod/models/qiita_article.dart';

class QiitaApiClient {
  dynamic fetchArticles(int page, String keyword) async {
    final response = await Dio().get(
      'https://qiita.com/api/v2/items?page=1&per_page=20',
      queryParameters: {
        'page': page,
        'per_page': 20,
        if (keyword != '') 'query': 'body:$keyword or tag:$keyword',
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ee77d5c1b7042a0c5ba1f5c1ed24742057f582e5',
        },
      ),
    );
    var articles = response.data
        .map((dynamic i) => QiitaArticle.fromJson(i as Map<String, dynamic>))
        .toList();

    return articles;
  }
}
