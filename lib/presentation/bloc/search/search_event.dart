part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class GetSearchNews extends SearchEvent {
  final String search;
  GetSearchNews({this.search});
}
