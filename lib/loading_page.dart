import 'package:clarify_flutter/clarify_ui.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final bool showAppBar;
  LoadingPage({this.showAppBar = true});
  @override
  Widget build(BuildContext context) {
    if (showAppBar) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: Container(
          decoration: clarifyGradientBox(),
          // child: CircularProgressIndicator(),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          decoration: clarifyGradientBox(),
          // child: CircularProgressIndicator(),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}
