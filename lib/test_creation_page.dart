import 'dart:math';

import 'package:clarify_flutter/model/water_report.dart';
import 'package:clarify_flutter/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/clarify_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEBUG ONLY.'),
      ),
      body: Container(
        decoration: clarifyGradientBox(),
        child: ListView(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          children: [
            SizedBox(height: 40),
            clarifyRaisedButton("Add Random Report", addRandomReport),
          ],
        ),
      ),
    );
  }

  void addRandomReport() {
    Timestamp now = Timestamp.now();
    Timestamp oldestAllowed = Timestamp.fromDate(DateTime.parse("1997-07-04"));

    int difference =
        now.millisecondsSinceEpoch - oldestAllowed.millisecondsSinceEpoch;

    int randomTime = ((Random.secure().nextDouble() * difference) +
            oldestAllowed.millisecondsSinceEpoch)
        .toInt();

    WaterReport report = new WaterReport(
        id: "NULL", // ID will get generated, not written so we're good.
        arsenic: Random.secure().nextDouble() * (0.01 + 0.005),
        lead: Random.secure().nextDouble() * (0.005 + 0.001),
        bacteria: Random.secure().nextDouble() * (1.0 + 0.5),
        overallStatus: Random.secure().nextInt(3),
        timestamp: Timestamp.fromMillisecondsSinceEpoch(randomTime));
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('water_quality_reports')
        .add(report.toMap());
  }
}
