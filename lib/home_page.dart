import 'package:clarify_flutter/custom_widgets/subscription_button.dart';
import 'package:clarify_flutter/learning_page.dart';
import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:clarify_flutter/shared_components/clarify_ui.dart';
import 'package:clarify_flutter/custom_widgets/test_history_button.dart';
import 'package:clarify_flutter/shared_components/todo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/sign_in.dart';
import 'package:clarify_flutter/admin_view/test_creation_page.dart';

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
  static const double spacing_height = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: clarifyBackgroundDecoration(),
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
              title: Text('Manage Subscriptions'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TodoPage())),
            ),
            ListTile(
              title: Text('Admin Console'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TestCreationPage())),
            ),
            ListTile(
                title: Text('Sign Out'),
                trailing: Icon(Icons.exit_to_app),
                onTap: () {
                  signOutGoogle();
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Clarify'),
        backgroundColor: ClarifyColors.clarifyAppBarColor,
      ),
      body: Container(
        decoration: clarifyBackgroundDecoration(),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            children: <Widget>[
              SizedBox(height: spacing_height),
              clarifyProfileButton(context),
              SizedBox(height: spacing_height),
              // Test Results button
              TestHistoryButton(),
              SizedBox(height: spacing_height),
              clarifyRaisedButton(
                  "Learn",
                  () => Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return LearningPage();
                      })),
                  subtext: "Learn about risks to your water.",
                  subtextColor: ClarifyColors.clarifySecondary[300]),
              SizedBox(height: spacing_height),
              SubscriptionButton(),
              SizedBox(height: spacing_height),
              clarifyBasicRaisedButton("Purchase a Test Kit", () {},
                  icon: Icon(Icons.credit_card)),
              SizedBox(height: spacing_height),
            ],
          ),
        ),
      ),
    );
  }
}
