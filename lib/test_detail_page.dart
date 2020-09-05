import 'package:clarify_flutter/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/clarify_ui.dart';
import 'package:clarify_flutter/model/water_report.dart';

class TestDetailPage extends StatelessWidget {
  final WaterReport waterReport;

  TestDetailPage({Key key, @required this.waterReport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return LoadingPage();
    return Scaffold(
        appBar: AppBar(title: Text(waterReport.getFormattedDate())),
        body: Container(
          decoration: clarifyGradientBox(),
          child: ListView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            children: [
              SizedBox(height: 30),
              clarifyContaminantIndicator(waterReport.getArsenicReport(), () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  // Page to learn about arsenic.
                  return TodoPage();
                }));
              }),
              SizedBox(height: 30),
              clarifyContaminantIndicator(waterReport.getBacteriaReport(), () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  // Page to learn about Bacteria.
                  return TodoPage();
                }));
              }),
              SizedBox(height: 30),
              clarifyContaminantIndicator(waterReport.getLeadReport(), () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  // Page to learn about Lead.
                  return TodoPage();
                }));
              }),
            ],
          ),
        ));
  }
}
