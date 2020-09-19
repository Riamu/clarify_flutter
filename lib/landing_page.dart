import 'package:clarify_flutter/shared_components/clarify_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/sign_in.dart';
import 'package:clarify_flutter/home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: clarifyBackgroundDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'Hi $firstName,',
                style: clarifyHeading(),
              ),
              Text(
                'Welcome to Clarify!',
                style: clarifyHeading(),
              ),
              SizedBox(height: 20),
              clarifyBasicRaisedButton('Continue', () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
