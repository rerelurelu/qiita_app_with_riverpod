import 'package:qiita_app_with_riverpod/apis/qiita_api_client.dart';

class ArticleRepository {
  final _api = QiitaApiClient();

  dynamic fetchArticles(int page, String keyword) async {
    return await _api.fetchArticles(page, keyword);
  }
}
