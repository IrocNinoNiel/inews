import 'package:flutter/material.dart';
import 'package:practice4/data/model/choice.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.choice,
    @required this.item,
    this.selected: false,
  }) : super(key: key);

  final Choice choice;

  final Choice item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
      color: Colors.white,
      child: Column(
        children: [
          new Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(choice.imglink)),
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(choice.title, style: Theme.of(context).textTheme.title),
                Text(choice.date,
                    style: TextStyle(color: Colors.black.withOpacity(0.5))),
                Text(choice.description),
              ],
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
