import 'package:clarify_flutter/clarify_ui.dart';
import 'package:clarify_flutter/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/clarify_colors.dart';
import 'package:clarify_flutter/landing_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: clarifyGradientBox(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Clarify',
                style: TextStyle(
                    fontSize: 60,
                    color: ClarifyColors.clarifyPrimary[900],
                    fontFamily: 'Avant-Garde-Gothic',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              googleSignInButton(() {
                signInWithGoogle().then((success) => {
                      if (success)
                        {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LandingPage();
                          }))
                        }
                      else
                        {print("Failed to sign in :_(")}
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
