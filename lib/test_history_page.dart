import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:clarify_flutter/loading_page.dart';
import 'package:clarify_flutter/model/water_report.dart';
import 'package:clarify_flutter/sign_in.dart';
import 'package:clarify_flutter/test_detail_page.dart';
import 'package:clarify_flutter/shared_components/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/shared_components/clarify_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Test Results'),
        backgroundColor: ClarifyColors.clarifyAppBarColor,
      ),
      body: Container(
        decoration: clarifyBackgroundDecoration(),
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
    if (snapshot.hasData && snapshot.data.docs.length > 0) {
      return ListView.separated(
          separatorBuilder: getListSeparator,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            WaterReport report = WaterReport.fromMap(
                snapshot.data.docs[index].data(), snapshot.data.docs[index].id);
            return getListItemForWaterReport(report, context);
          });
    } else if (snapshot.hasData) {
      return Container(
          decoration: clarifyBackgroundDecoration(),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  "No test history found.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 230, 10, 0),
                    fontFamily: 'Century-Gothic',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                // TODO: Bring the user to the subscription page.
                clarifyRaisedButton("Subscribe to Testing", () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TodoPage();
                  }));
                }),
              ],
            ),
          ));
    }
    return LoadingPage(showAppBar: false);
  }

  Widget getListItemForWaterReport(WaterReport report, BuildContext context) {
    return RaisedButton(
        onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TestDetailPage(waterReport: report);
              }))
            },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
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
                      report.getFormattedDate(),
                      style: TextStyle(
                          fontFamily: 'Avant-Garde-Gothic',
                          fontSize: 25,
                          color: ClarifyColors.clarifyPrimary[900],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      report.getOverallStatusString(),
                      style: TextStyle(
                        fontFamily: 'Century-Gothic',
                        color: report.getStatusColor(),
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

Widget getListSeparator(BuildContext context, int position) {
  return SizedBox(
    height: 20.0,
  );
}
