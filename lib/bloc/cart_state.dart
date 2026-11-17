import 'package:cart_screen/model/model.dart';

abstract class CartState {}
class CartInitial extends CartState{}
class CartUpdate extends CartState{
  final List<ProductModel>productss;
  CartUpdate(this.productss);
}