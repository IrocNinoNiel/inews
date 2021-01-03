import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practice4/data/model/news.dart';

class NewsCardHorizontal extends StatelessWidget {
  const NewsCardHorizontal(
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
        leading: CachedNetworkImage(
          imageUrl: news.getImgLink(),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(news.getTitle(),
            maxLines: 3,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 18)),
        trailing: IconButton(
          icon: news.getFavorite() ? Icon(Icons.star) : Icon(Icons.star_border),
          onPressed: addToFavorite,
          iconSize: 40.0,
        ),
      ),
    );
  }
}
