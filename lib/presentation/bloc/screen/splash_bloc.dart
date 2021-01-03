import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice4/data/model/news.dart';
import 'package:practice4/repository/newsrepository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final NewsRepository _newsRepository;

  SplashBloc(this._newsRepository) : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is GetSplashScreen) {
      yield SplashLoading();

      try {
        List<News> dummyList;
        dummyList = await _newsRepository.fetchAllHeadlineNews();
        print(dummyList);
        yield SplashLoaded();
      } catch (e) {
        print(e);
        yield SplashNetworkError('You are Not Connected to the Internet');
      }
    }
  }
}
