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
                  Text(news.getAuthor()),
                  Text(news.getSource()),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas augue massa, tincidunt ut euismod sit amet, venenatis finibus dolor. Donec luctus vestibulum velit, sed sagittis dolor accumsan non. Nulla sed pellentesque eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed iaculis odio interdum viverra congue. Suspendisse varius odio at est iaculis, quis sodales ante condimentum. Proin vel ex vitae urna ultrices rutrum. Suspendisse potenti. Integer tincidunt tellus quis lorem convallis mollis. Cras ultricies porttitor diam, sed ultricies elit maximus eu. Fusce velit nibh, tincidunt a placerat eu, dapibus vitae orci. Morbi fringilla urna risus, et tempor justo finibus ac. Integer eget suscipit justo, maximus ultricies ante. Donec faucibus condimentum commodo. Integer luctus lacinia lacinia. Sed ut dui placerat, gravida ex quis, mattis eros.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas augue massa, tincidunt ut euismod sit amet, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas augue massa, tincidunt ut euismod sit amet, venenatis finibus dolor. Donec luctus vestibulum velit, sed sagittis dolor accumsan non. Nulla sed pellentesque eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed iaculis odio interdum viverra congue. Suspendisse varius odio at est iaculis, quis sodales ante condimentum. Proin vel ex vitae urna ultrices rutrum. Suspendisse potenti. Integer tincidunt tellus quis lorem convallis mollis. Cras ultricies porttitor diam, sed ultricies elit maximus eu. Fusce velit nibh, tincidunt a placerat eu, dapibus vitae orci. Morbi fringilla urna risus, et tempor justo finibus ac. Integer eget suscipit justo, maximus ultricies ante. Donec faucibus condimentum commodo. Integer luctus lacinia lacinia. Sed ut dui placerat, gravida ex quis, mattis eros.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas augue massa, tincidunt ut euismod sit amet, "),
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
