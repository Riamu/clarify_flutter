import 'package:flutter/material.dart';
import 'package:clarify_flutter/shared_components/clarify_ui.dart';

/// The purpose of this page is twofold:
///   1. Provide a placeholder page for unimplemented pages.
///   2. Keeps track of which pages have yet to be implemented.
class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TODO: Create this page")),
        body: Container(
          decoration: clarifyBackgroundDecoration(),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
