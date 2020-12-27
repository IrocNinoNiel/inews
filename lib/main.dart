import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice4/presentation/bloc/screen/splash_bloc.dart';
import 'package:practice4/presentation/ui/homepage/homepage.dart';
import 'package:practice4/presentation/ui/splash/splashscreen.dart';
import 'package:practice4/repository/newsrepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: WelcomeFlashScreen(),
      home: BlocProvider(
        create: (context) =>
            SplashBloc(NewsRepository())..add(GetSplashScreen()),
        child: App(),
      ), // MyHomePageState()
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashNetworkError) {
          ShowErrorMessage(
            errMsg: state.message,
          );
        }
      },
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          if (state is SplashInitial) {
            return WelcomeFlashScreen();
          } else if (state is SplashLoading) {
            return WelcomeFlashScreen();
          } else if (state is SplashLoaded) {
            return HomePageParent();
          } else if (state is SplashNetworkError) {
            return ShowErrorMessage(
              errMsg: state.message,
            );
          }

          return HomePageParent();
        },
      ),
    );
  }
}

class ShowErrorMessage extends StatelessWidget {
  final String errMsg;

  const ShowErrorMessage({Key key, this.errMsg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(errMsg),
    ));
  }
}
