import 'package:riverpod_annotation/riverpod_annotation.dart';

    part 'search_query_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return ''; // Default empty search
  }

  void setQuery(String query) {
    state = query;
  }
}