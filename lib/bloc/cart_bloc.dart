import 'package:cart_screen/bloc/cart_even.dart';
import 'package:cart_screen/bloc/cart_state.dart';
import 'package:cart_screen/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc  extends Bloc<CartEvent ,CartState>{
  List<ProductModel>productList =[];
  CartBloc():super(CartInitial()){
//add
 on<AddToCartEvent>((event, emit) {
   productList.add(event.productss);
   emit(CartUpdate(List.from(productList)));
 } ,);
 //remove
 on<RemoveCartEvent>((event, emit) {
   productList.remove(event.products);
   emit(CartUpdate(List.from(productList)));
 },);
  }
}