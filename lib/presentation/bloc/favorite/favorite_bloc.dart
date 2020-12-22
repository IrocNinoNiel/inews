import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice4/data/model/news.dart';
import 'package:practice4/repository/favoriterepository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _favoriteRepository;

  FavoriteBloc(this._favoriteRepository) : super(FavoritesInitial());

  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is GetFavoriteNews) {
      try {
        yield FavoritesLoading();
        List<News> newsFavorite;
        newsFavorite = await _favoriteRepository.fetchAllFavoriteNews();
        yield FavoritesLoaded(newsFavorite);
      } catch (e) {
        yield FavoritesError('Something is wrong');
      }
    }
  }
}
