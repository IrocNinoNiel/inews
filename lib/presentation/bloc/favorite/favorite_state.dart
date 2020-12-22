part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {
  const FavoriteState();
}

class FavoritesInitial extends FavoriteState {
  const FavoritesInitial();
}

class FavoritesLoading extends FavoriteState {
  const FavoritesLoading();
}

class FavoritesLoaded extends FavoriteState {
  final List<News> newsFavorite;
  const FavoritesLoaded(this.newsFavorite);
}

class FavoritesError extends FavoriteState {
  final String message;
  const FavoritesError(this.message);
}
