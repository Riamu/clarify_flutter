import 'package:clarify_flutter/clarify_colors.dart';
import 'package:clarify_flutter/model/water_report.dart';
import 'package:clarify_flutter/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/clarify_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Test Results'),
      ),
      body: Container(
        decoration: clarifyGradientBox(),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(userID)
              .collection('water_quality_reports')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: buildReportList,
        ),
      ),
    );
  }

  Widget buildReportList(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      return ListView.separated(
          separatorBuilder: getListSeparator,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            WaterReport report = WaterReport.fromMap(
                snapshot.data.docs[index].data(), snapshot.data.docs[index].id);
            return getListItemForWaterReport(report);
          });
    } else if (snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasData) {
      // No data found.
      return CircularProgressIndicator();
    } else {
      return CircularProgressIndicator();
    }
  }
}

Widget getListSeparator(BuildContext context, int position) {
  return SizedBox(
    height: 10,
  );
}

Widget getListItemForWaterReport(WaterReport report) {
  return RaisedButton(
    onPressed: () => print(report),
    splashColor: ClarifyColors.clarifySecondary,
    color: ClarifyColors.clarifyTertiary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Text(
            report.getFormattedDate(),
            style: TextStyle(
                fontFamily: 'Century-Gothic',
                fontSize: 20,
                color: ClarifyColors.clarifyPrimary[900],
                fontWeight: FontWeight.bold),
          ),
          Text(
            report.getOverallStatusString(),
            style: TextStyle(
              color: report.getStatusColor(),
            ),
          ),
        ],
      ),
    ),
  );
}
