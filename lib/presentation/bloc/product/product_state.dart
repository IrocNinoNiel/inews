part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<Choice> productChoices;
  const ProductLoaded(this.productChoices);
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
}
