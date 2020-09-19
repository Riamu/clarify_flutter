import 'package:clarify_flutter/custom_widgets/contaminant_page.dart';
import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/shared_components/clarify_ui.dart';
import 'package:clarify_flutter/model/water_report.dart';

class TestDetailPage extends StatelessWidget {
  final WaterReport waterReport;

  TestDetailPage({Key key, @required this.waterReport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(waterReport.getFormattedDate()),
          backgroundColor: ClarifyColors.clarifyAppBarColor,
        ),
        body: Container(
          decoration: clarifyBackgroundDecoration(),
          child: ListView(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            children: [
              clarifyContaminantIndicator(waterReport.getArsenicReport(), () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  // Page to learn about arsenic.
                  return ContaminantPage('arsenic');
                }));
              }),
              SizedBox(height: 20),
              clarifyContaminantIndicator(waterReport.getBacteriaReport(), () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  // Page to learn about Bacteria.
                  return ContaminantPage('bacteria');
                }));
              }),
              SizedBox(height: 20),
              clarifyContaminantIndicator(waterReport.getLeadReport(), () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  // Page to learn about Lead.
                  return ContaminantPage('lead');
                }));
              }),
            ],
          ),
        ));
  }
}
