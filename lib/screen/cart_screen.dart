import 'package:cart_screen/bloc/cart_bloc.dart';
import 'package:cart_screen/bloc/cart_even.dart';
import 'package:cart_screen/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Products"), centerTitle: true),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdate) {
            final product = state.productss;
            int totalItems = product.length;
            int totalAmount = 0;
            for (var item in product) {
              totalAmount += item.productPrice;
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      final items = product[index];
                      return Card(
                        child: Column(
                          children: [
                            Text(items.productName),
                            Text(items.productDescription),
                            Text("${items.productPrice}"),
                            SizedBox(height: 5),

                            ElevatedButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                  RemoveCartEvent(items),
                                );
                              },
                              child: Text("Remove"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text("Total items"), Text("$totalItems")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Total products"),
                          Text("$totalAmount"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(child: Text("Cart is empty"));
        },
      ),
    );
  }
}
