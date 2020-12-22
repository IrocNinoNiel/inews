import 'package:equatable/equatable.dart';
import 'package:practice4/data/api/product.dart';

class ProductRepository extends Equatable {
  final todoApiProvider = ApiHelper.instance;

  Future<List<dynamic>> fetchAllProduct() => todoApiProvider.getProduct();
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
