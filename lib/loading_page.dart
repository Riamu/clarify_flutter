import 'package:clarify_flutter/clarify_ui.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: clarifyGradientBox(),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
