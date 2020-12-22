import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice4/presentation/bloc/news/news_bloc.dart';
import 'package:practice4/presentation/ui/homepage/homepage.dart';
import 'package:practice4/presentation/ui/splash/splashscreen.dart';
import 'package:practice4/repository/favoriterepository.dart';
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
        create: (context) => NewsBloc(NewsRepository(), FavoriteRepository())
          ..add(GetHeadlineNews()),
        child: MyHomePageState(),
      ), // MyHomePageState()
    );
  }
}
