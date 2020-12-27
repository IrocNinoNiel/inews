import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice4/data/model/news.dart';
import 'package:practice4/repository/favoriterepository.dart';
import 'package:practice4/repository/newsrepository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  final FavoriteRepository _favoriteRepository;
  NewsBloc(this._newsRepository, this._favoriteRepository)
      : super(NewsInitial());

  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is GetHeadlineNews) {
      try {
        yield NewsLoading();

        List<News> newsHeadline;
        newsHeadline = await _newsRepository.fetchAllHeadlineNews();

        List<Map<String, dynamic>> result;
        result = await _favoriteRepository.fetchAllFavoriteNews();

        newsHeadline.forEach((element) {
          result.forEach((element1) {
            if (element.getId() == element1['id']) {
              element.setFavorite(true);
            }
          });
        });

        yield NewsLoaded(newsHeadline);
      } catch (e) {
        print(e);
        yield NewsError('Something is wrong');
      }
    } else if (event is GetTypeNews) {
      try {
        yield NewsLoading();
        List<News> newsTypeHeadline;
        if (event.type == 'general') {
          newsTypeHeadline = await _newsRepository.fetchAllHeadlineNews();
        } else if (event.type == 'ph') {
          newsTypeHeadline = await _newsRepository.fetchPhNews();
        } else {
          newsTypeHeadline = await _newsRepository.fetchAllTypeNews(event.type);
        }

        List<Map<String, dynamic>> result;
        result = await _favoriteRepository.fetchAllFavoriteNews();

        newsTypeHeadline.forEach((element) {
          result.forEach((element1) {
            if (element.getId() == element1['id']) {
              element.setFavorite(true);
            }
          });
        });

        yield NewsLoaded(newsTypeHeadline);
      } catch (e) {
        yield NewsError('Something is wrong');
      }
    } else if (event is GetFavoriteNews) {
      try {
        yield NewsLoading();
        List<News> newsFavorite = [];
        List<Map<String, dynamic>> result;
        result = await _favoriteRepository.fetchAllFavoriteNews();
        result.forEach((element) {
          print(element['favorite']);
          newsFavorite.add(News(
              id: element['id'],
              title: element['title'],
              author: element['author'],
              description: element['description'],
              imglink: element['imglink'],
              content: element['content'],
              source: element['source'],
              publishedAt: element['publishedAt'],
              isFavorite: element['favorite'] == 0 ? false : true));
        });

        yield NewsFavoriteLoaded(newsFavorite);
      } catch (e) {
        print(e);
        yield NewsError('Something is wrong');
      }
    } else if (event is ToggleNews) {
      try {
        yield NewsLoading();
        // print(event.news.getFavorite() == true);
        if (event.news.getFavorite()) {
          event.news.setFavorite(!event.news.getFavorite());
          await _favoriteRepository.deleteFavoriteNews(event.news.getId());
          event.newsList.forEach((element) {
            if (element.getId() == event.news.getId()) {
              element.setFavorite(false);
            }
          });
        } else {
          event.news.setFavorite(!event.news.getFavorite());

          event.newsList.forEach((element) {
            if (element.getId() == event.news.getId()) {
              element.setFavorite(true);
            }
          });
        }

        yield NewsLoaded(event.newsList);
      } catch (e) {
        print(e);
        yield NewsError('Something is wrong');
      }
    }
  }
}
