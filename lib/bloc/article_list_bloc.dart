import 'dart:async';

import 'package:article_finder/bloc/bloc.dart';
import 'package:article_finder/data/article.dart';
import 'package:article_finder/data/rw_client.dart';
import 'package:rxdart/rxdart.dart';

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
    articleStream = _searchQueryController.stream
        .startWith(null) // 1
        .debounceTime(const Duration(milliseconds: 100)) // 2
        .switchMap(
          // 3
          (query) => _client
              .fetchArticles(query)
              .asStream() // 4
              .startWith(null), // 5
        );
  }

  // 6
  @override
  void dispose() {
    _searchQueryController.close();
  }
}
