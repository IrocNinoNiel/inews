import 'package:equatable/equatable.dart';
import 'package:practice4/data/api/newsapi.dart';

class NewsRepository extends Equatable {
  final newsApiProvider = NewsApiHelper.instance;

  Future<List<dynamic>> fetchAllHeadlineNews() =>
      newsApiProvider.getNewsHeadline();

  Future<List<dynamic>> fetchAllTypeNews(String type) =>
      newsApiProvider.getTypeNews(type);

  Future<List<dynamic>> fetchPhNews() => newsApiProvider.getPhHeadline();
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
