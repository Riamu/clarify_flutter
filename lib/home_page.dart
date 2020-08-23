import 'package:clarify_flutter/clarify_ui.dart';
import 'package:clarify_flutter/test_history_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/sign_in.dart';

// TODO: Re-jiggle the page hierarchy for better login flow.
// if the user is signed-out when they launch the app it should be in this \
// order:
//   HomePage -> Welcome -> SignIn
// so that when the User signs in, we can pop the SignIn page and be at the
// welcome page. Then the user can hit continue and be popped to the HomePage.
// If the user *is* signed in, they'll automatically be at the home page.
// The signOut function should push the welcome and SignIn pages back to the
// navigation stack.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(email),
              onDetailsPressed: () => print("Details!"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('Item 2'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Clarify'),
      ),
      body: Container(
        decoration: clarifyGradientBox(),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            children: <Widget>[
              SizedBox(height: 40),
              clarifyRaisedButton(
                  "Test Results",
                  () => Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return TestHistoryPage();
                      }))),
              SizedBox(height: 40),
              clarifyRaisedButton("Button 2", () => print("Button 2 pressed.")),
              SizedBox(height: 40),
              clarifyRaisedButton("Logout", () => signOutGoogle()),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
