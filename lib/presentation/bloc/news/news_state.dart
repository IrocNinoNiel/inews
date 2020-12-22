part of 'news_bloc.dart';

@immutable
abstract class NewsState {
  const NewsState();
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsLoaded extends NewsState {
  final List<News> newsHeadline;
  const NewsLoaded(this.newsHeadline);
}

class NewsError extends NewsState {
  final String message;
  const NewsError(this.message);
}
