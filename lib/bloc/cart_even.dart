import 'package:cart_screen/model/model.dart';

abstract class CartEvent {}
class AddToCartEvent extends CartEvent{
  final ProductModel productss;
  AddToCartEvent(this.productss);
}
class RemoveCartEvent extends CartEvent{
  final ProductModel products;
  RemoveCartEvent(this.products);
}

