part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetHeadlineNews extends NewsEvent {
  GetHeadlineNews();
}

class GetTypeNews extends NewsEvent {
  final String type;
  GetTypeNews({this.type});
}

class GetFavoriteNews extends NewsEvent {
  GetFavoriteNews();
}

class ToggleNews extends NewsEvent {
  final List<News> newsList;
  final News news;
  ToggleNews({this.news, this.newsList});
}

class ToggleNewsFavorite extends NewsEvent {
  final List<News> newsList;
  final News news;
  ToggleNewsFavorite({this.news, this.newsList});
}

// class UnLikeNews extends NewsEvent {
//   final News news;
//   UnLikeNews({this.news});
// }
