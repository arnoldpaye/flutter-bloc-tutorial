import 'dart:async';

import 'package:article_finder/bloc/bloc.dart';
import 'package:article_finder/data/article.dart';
import 'package:article_finder/data/rw_client.dart';

class ArticleListBloc implements Bloc {
  // 1
  final _client = RWClient();
  // 2
  final _searchQueryController = StreamController<String?>();
  // 3
  Sink<String?> get searchQuery => _searchQueryController.sink;
  // 4
  late Stream<List<Article>?> articleStream;

  ArticleListBloc() {
    // 5
    articleStream = _searchQueryController.stream
        .asyncMap((query) => _client.fetchArticles(query));
  }

  // 6
  @override
  void dispose() {
    _searchQueryController.close();
  }
}
