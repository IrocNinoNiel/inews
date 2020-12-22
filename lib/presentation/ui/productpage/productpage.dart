import 'package:flutter/material.dart';
import 'package:practice4/data/model/choice.dart';
import 'package:practice4/presentation/ui/productpage/productcard.dart';

class ProductPage extends StatelessWidget {
  final Choice product;

  const ProductPage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyProductPageState(
      product: this.product,
    );
  }
}

class MyProductPageState extends StatefulWidget {
  final Choice product;

  const MyProductPageState({Key key, this.product}) : super(key: key);
  _MyProductPageState createState() =>
      _MyProductPageState(product: this.product);
}

class _MyProductPageState extends State<MyProductPageState> {
  final Choice product;

  _MyProductPageState({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: ProductCard(
            choice: product,
            item: product,
          ),
        ),
      ),
    );
  }
}
