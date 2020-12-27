part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class GetSplashScreen extends SplashEvent {
  GetSplashScreen();
}
