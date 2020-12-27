import 'package:flutter/material.dart';
import 'package:practice4/data/model/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    this.news,
    @required this.item,
    this.selected: false,
  }) : super(key: key);

  final News news;

  final News item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return SingleChildScrollView(
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            new Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(news.getImgLink())),
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news.getTitle(),
                      style: Theme.of(context).textTheme.title),
                  Text(news.getPublishedAt(),
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(news.getAuthor())),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(news.getSource())),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(news.getContent()),
                  ),
                ],
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
