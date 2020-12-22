part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class GetFavoriteNews extends FavoriteEvent {
  GetFavoriteNews();
}

class LikeNews extends FavoriteEvent {
  LikeNews();
}

class UnLikeNews extends FavoriteEvent {
  UnLikeNews();
}
