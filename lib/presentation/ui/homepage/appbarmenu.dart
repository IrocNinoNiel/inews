import 'package:flutter/material.dart';
import 'package:practice4/presentation/color/Color.dart';

AppBar appBarMenu(Function navigationToSearchPage) {
  return AppBar(
    backgroundColor: PrimaryColor,
    elevation: 1.0,
    title: Text("iNews"),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: navigationToSearchPage)
    ],
  );
}
