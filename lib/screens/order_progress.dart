import 'package:flutter/material.dart';

class OrderProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Progress')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Placed'),
            LinearProgressIndicator(),
            Text('Clothes Picked Up'),
            LinearProgressIndicator(),
            Text('Washing in Progress'),
            LinearProgressIndicator(),
            Text('Ready for Delivery'),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
