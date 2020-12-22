import 'package:equatable/equatable.dart';
import 'package:practice4/data/model/news.dart';
import 'package:practice4/data/sql/localnewsstorage.dart';

class FavoriteRepository extends Equatable {
  final newsApiProvider = DatabaseHelper.instance;

  Future<List<dynamic>> fetchAllFavoriteNews() =>
      newsApiProvider.getLocalStorageNews();

  Future<int> addFavoriteNews(News news) =>
      newsApiProvider.addToFavoriteNews(news);

  Future<void> deleteFavoriteNews(String id) =>
      newsApiProvider.deleteFavoriteNews(id);

  List<Object> get props => throw UnimplementedError();
}
