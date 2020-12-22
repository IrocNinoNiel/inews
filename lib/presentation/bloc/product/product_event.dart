part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProduct extends ProductEvent {
  GetProduct();
}
