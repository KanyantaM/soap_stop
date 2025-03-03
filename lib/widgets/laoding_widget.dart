import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SoapStopLoadingWidget extends StatelessWidget {
  const SoapStopLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LoadingAnimationWidget.inkDrop(
        color: Colors.blue,
        size: 50,
      ),
    ));
  }
}
