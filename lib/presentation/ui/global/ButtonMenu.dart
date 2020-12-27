import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final Function findTypeNews;
  final String buttonText;

  const ButtonMenu({Key key, this.findTypeNews, this.buttonText})
      : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)),
          color: Colors.white,
          textColor: Colors.red,
          child: Text(buttonText),
          onPressed: findTypeNews),
    );
  }
}
