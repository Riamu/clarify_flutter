import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:clarify_flutter/shared_components/clarify_ui.dart';
import 'package:clarify_flutter/shared_components/todo_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sign_in.dart';

class SubscriptionButton extends StatelessWidget {
  final Future<Text> _subtextFuture = FirebaseFirestore.instance
      .collection('users')
      .doc(userID)
      .get()
      .then((value) {
    if (value.data()['subscribed']) {
      return Text(
        "You're Subscribed!",
        style: TextStyle(
          color: Colors.green,
          fontFamily: 'Century-Gothic',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );
    }
    return Text(
      "Tap here to subscribe.",
      style: TextStyle(
        color: ClarifyColors.clarifyAccent[50],
        fontFamily: 'Century-Gothic',
        fontSize: 20,
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return TodoPage();
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
                Icon(Icons.credit_card),
                SizedBox(width: 15),
                Column(
                  children: [
                    Text(
                      "Manage Subscription",
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
