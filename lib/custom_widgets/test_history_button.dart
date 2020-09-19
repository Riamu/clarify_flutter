import 'package:clarify_flutter/model/water_report.dart';
import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:clarify_flutter/shared_components/clarify_ui.dart';
import 'package:clarify_flutter/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../test_history_page.dart';

class TestHistoryButton extends StatelessWidget {
  final Future<Text> _subtextFuture = FirebaseFirestore.instance
      .collection('users')
      .doc(userID)
      .collection('water_quality_reports')
      .orderBy('date', descending: true)
      .limit(1)
      .get()
      .then((value) {
    WaterReport report =
        WaterReport.fromMap(value.docs[0].data(), value.docs[0].id);
    return Text(
      report.getOverallStatusString(),
      style: TextStyle(
        color: report.getStatusColor(),
        fontSize: 20,
        fontFamily: 'Century-Gothic',
      ),
    );
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return TestHistoryPage();
        }));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
          decoration: clarifyButtonDecoration(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Test History",
                      style: TextStyle(
                        fontFamily: 'Avant-Garde-Gothic',
                        fontSize: 25,
                        color: ClarifyColors.clarifyPrimary[900],
                      ),
                    ),
                    FutureBuilder<Widget>(
                      future: _subtextFuture,
                      builder: (BuildContext context,
                          AsyncSnapshot<Widget> snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data;
                        }
                        return SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
