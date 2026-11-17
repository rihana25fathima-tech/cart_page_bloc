import 'package:cart_screen/bloc/cart_bloc.dart';
import 'package:cart_screen/bloc/cart_even.dart';
import 'package:cart_screen/bloc/cart_state.dart';
import 'package:cart_screen/model/model.dart';
import 'package:cart_screen/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScree extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel>products =[
  ProductModel(
    id: 1,
    productName: 'Mobile',
    productPrice: 15000,
    productDescription: 'Samsung Mobile',
  ),
  ProductModel(
    id: 2,
    productName: 'Laptop',
    productPrice: 45000,
    productDescription: 'HP Laptop',
  ),
    ];
    return BlocListener(listener:(context, state) {
      if(state is CartUpdate){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cart Updated succefullly")));
      }
    }, child: 
     Scaffold(
      appBar: AppBar(
        title: Text("Shopping Products"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: 
          ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final items = products[index];
            return Card(
              child: Column(
                children: [
                      Text(items.productName),
                      Text(items.productDescription),
                      Text("${items.productPrice}"),
                  
                  SizedBox(height: 5,),
                  ElevatedButton(onPressed: () {
                    context.read<CartBloc>().add(AddToCartEvent(items));
                  }, child: Text("add to cart"))
                ],
              ),
            );
          },)
          ),
        ],
      ),
     )
    );
  }
}