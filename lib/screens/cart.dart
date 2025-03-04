import 'package:flutter/material.dart';
import 'package:soap_stop/screens/order_progress.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Center(
        child: Text('Cart Items will be displayed here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderProgressScreen(
                      orderProgress: OrderProgress(
                          orderId: "123", status: OrderStatus.washing),
                    )),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
