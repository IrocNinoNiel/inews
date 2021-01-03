import 'package:flutter/material.dart';
import 'package:practice4/data/model/news.dart';
import 'package:practice4/presentation/color/Color.dart';
import 'package:practice4/presentation/ui/newspage/newscard.dart';

class NewsPage extends StatelessWidget {
  final News news;

  const NewsPage({Key key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyNewsPageState(
      news: this.news,
    );
  }
}

class MyNewsPageState extends StatefulWidget {
  final News news;

  const MyNewsPageState({Key key, this.news}) : super(key: key);
  _MyNewsPageState createState() => _MyNewsPageState(news: this.news);
}

class _MyNewsPageState extends State<MyNewsPageState> {
  final News news;

  _MyNewsPageState({this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
      ),
      body: Container(
        child: NewsCard(
          news: news,
          item: news,
        ),
      ),
    );
  }
}
