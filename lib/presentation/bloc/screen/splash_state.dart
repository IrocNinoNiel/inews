part of 'splash_bloc.dart';

@immutable
abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashLoaded extends SplashState {
  const SplashLoaded();
}

class SplashNetworkError extends SplashState {
  final String message;
  const SplashNetworkError(this.message);
}
