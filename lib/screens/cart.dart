import 'package:flutter/material.dart';
import 'package:soap_stop/screens/order_progress.dart';

class CartScreen extends StatelessWidget {
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
            MaterialPageRoute(builder: (context) => OrderProgressScreen()),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
