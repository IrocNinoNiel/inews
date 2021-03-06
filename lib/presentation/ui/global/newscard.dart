import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practice4/data/model/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {Key key,
      this.news,
      this.onTap,
      @required this.item,
      this.selected: false,
      this.navigationToNewsPage,
      this.addToFavorite})
      : super(key: key);

  final News news;

  final VoidCallback onTap;

  final News item;

  final bool selected;

  final Function navigationToNewsPage;

  final Function addToFavorite;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
        color: Colors.white,
        child: ListTile(
          onTap: navigationToNewsPage,
          title: Column(
            children: [
              new Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: news.getImgLink(),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )),
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(news.getTitle(),
                        style: Theme.of(context).textTheme.title),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(news.getPublishedAt(),
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5))),
                        IconButton(
                          icon: news.getFavorite()
                              ? Icon(Icons.star)
                              : Icon(Icons.star_border),
                          onPressed: addToFavorite,
                          iconSize: 40.0,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ));
  }
}
