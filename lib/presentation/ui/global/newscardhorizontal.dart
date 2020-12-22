import 'package:flutter/material.dart';
import 'package:practice4/data/model/news.dart';

class NewsCardHorizontal extends StatelessWidget {
  const NewsCardHorizontal(
      {Key key,
      this.news,
      this.onTap,
      @required this.item,
      this.selected: false,
      this.navigationToProductPage})
      : super(key: key);

  final News news;

  final VoidCallback onTap;

  final News item;

  final bool selected;

  final Function navigationToProductPage;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
        color: Colors.white,
        child: ListTile(
            onTap: navigationToProductPage,
            title: Row(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(news.getImgLink()))),
                ),
                Container(
                  height: 100,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      child: Flexible(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(news.getTitle(),
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: 25))
                          ],
                        ),
                      )),
                )
              ],
            )));
  }
}
