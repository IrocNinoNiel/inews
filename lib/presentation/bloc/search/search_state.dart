part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  final List<News> newsSearch;
  const SearchLoaded(this.newsSearch);
}

class SearchNoResult extends SearchState {
  final String message;
  const SearchNoResult(this.message);
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
}
