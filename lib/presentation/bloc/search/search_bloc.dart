import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice4/data/model/news.dart';
import 'package:practice4/repository/searchrepository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;
  SearchBloc(this._searchRepository) : super(SearchInitial());

  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is GetSearchNews) {
      try {
        yield SearchLoading();
        final searchNews =
            await _searchRepository.fetchSearchNews(event.search);
        if (searchNews.length == 0) {
          yield SearchNoResult("No Result Found");
        } else {
          yield SearchLoaded(searchNews);
        }
      } catch (e) {
        yield SearchError("Not Connected to the internet");
      }
    }
  }
}
