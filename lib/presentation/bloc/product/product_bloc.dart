import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice4/data/model/choice.dart';
import 'package:practice4/repository/productrepository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc(this._productRepository) : super(ProductInitial());

  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is GetProduct) {
      try {
        yield ProductLoading();
        final productChoices = await _productRepository.fetchAllProduct();
        yield ProductLoaded(productChoices);
      } catch (e) {
        yield ProductError('Something is wrong');
      }
    }
  }
}
