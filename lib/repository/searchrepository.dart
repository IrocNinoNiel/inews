import 'package:equatable/equatable.dart';
import 'package:practice4/data/api/newsapi.dart';

class SearchRepository extends Equatable {
  final newsApiProvider = NewsApiHelper.instance;

  Future<List<dynamic>> fetchAllHeadlineNews() =>
      newsApiProvider.getNewsHeadline();

  Future<List<dynamic>> fetchSearchNews(String search) =>
      newsApiProvider.getSearchNews(search);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
