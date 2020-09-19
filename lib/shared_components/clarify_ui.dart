import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:clarify_flutter/model/contaminant_report.dart';
import 'package:clarify_flutter/shared_components/todo_page.dart';
import 'package:flutter/material.dart';

import '../sign_in.dart';

/// Package for UI elements that have been custom styled for Clarify.

// The gradient used for buttons
LinearGradient clarifyLinearGradient = LinearGradient(colors: [
  ClarifyColors.clarifyTertiary[500],
  ClarifyColors.clarifyTertiary[50],
  ClarifyColors.clarifyTertiary[500],
]);

BoxDecoration clarifyButtonDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(colors: [
      ClarifyColors.clarifyTertiary[50],
      ClarifyColors.clarifyTertiary[500],
      ClarifyColors.clarifyTertiary[50],
    ]),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  );
}

/// The gradient used for the background
BoxDecoration clarifyBackgroundDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          // Colors.white,
          Colors.white,
          ClarifyColors.clarifyTertiary[800],
        ]),
  );
}

Shadow clarifyBlackShadow =
    Shadow(blurRadius: 3.0, offset: Offset(1.0, 1.0), color: Colors.black);

/// A RaisedButton appropriate for the main action on a view.
RaisedButton clarifyRaisedButton(String text, Function onPressed,
    {String subtext = "", Color subtextColor = Colors.black}) {
  return RaisedButton(
    onPressed: onPressed,
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
                  text,
                  style: TextStyle(
                    fontFamily: 'Avant-Garde-Gothic',
                    fontSize: 25,
                    color: ClarifyColors.clarifyPrimary[900],
                  ),
                ),
                Text(
                  subtext,
                  style: TextStyle(
                    color: subtextColor,
                    fontFamily: 'Century-Gothic',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

RaisedButton clarifyBasicRaisedButton(String text, Function onPressed,
    {Icon icon}) {
  return RaisedButton(
    onPressed: onPressed,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    padding: const EdgeInsets.all(0.0),
    child: Ink(
      decoration: clarifyButtonDecoration(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon : SizedBox(),
            icon != null ? SizedBox(width: 15) : SizedBox(),
            Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Avant-Garde-Gothic',
                    fontSize: 25,
                    color: ClarifyColors.clarifyPrimary[900],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

/// A text style appropriate for most headings in content views.
TextStyle clarifyHeading() {
  return TextStyle(
      fontFamily: 'Lucida-Fax',
      fontSize: 25,
      color: ClarifyColors.clarifyPrimary[900],
      fontWeight: FontWeight.bold);
}

/// A 'sign in with google' button styled for Clarify
RaisedButton googleSignInButton(Function onPressed) {
  return RaisedButton(
    // splashColor: ClarifyColors.clarifySecondary,
    // color: ClarifyColors.clarifyPrimary[50],
    onPressed: onPressed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    padding: const EdgeInsets.all(0.0),
    highlightElevation: 0,
    child: Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        gradient: LinearGradient(colors: [
          ClarifyColors.clarifyTertiary[500],
          ClarifyColors.clarifyTertiary[50],
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontFamily: 'Century-Gothic',
                  fontSize: 20,
                  color: ClarifyColors.clarifyPrimary[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

RaisedButton clarifyProfileButton(BuildContext context) {
  return RaisedButton(
    onPressed: () =>
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return TodoPage();
    })),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    padding: const EdgeInsets.all(0.0),
    child: Ink(
      decoration: clarifyButtonDecoration(),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 30,
              backgroundColor: Colors.transparent,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 30,
                    color: ClarifyColors.clarifyPrimary[900],
                    fontFamily: 'Avant-Garde-Gothic',
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    color: ClarifyColors.clarifySecondary[300],
                    fontFamily: 'Century-Gothic',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget clarifyContaminantIndicator(
    ContaminantReport report, Function onPressed) {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    padding: const EdgeInsets.all(0),
    color: ClarifyColors.clarifyPrimary,
    splashColor: ClarifyColors.clarifyAccent,
    child: Ink(
      decoration: clarifyButtonDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              report.name +
                  ": " +
                  report.concentration.toStringAsFixed(5) +
                  " " +
                  report.unitAbbreviation,
              style: TextStyle(
                color: ClarifyColors.clarifyPrimary[900],
                fontFamily: 'Avant-Garde-Gothic',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            // TODO: We should replace this with a custom one with min max
            // markings.
            LinearProgressIndicator(
              value: report.concentration / report.upperBound,
              minHeight: 10,
              valueColor: report.concentration < report.upperBound
                  ? AlwaysStoppedAnimation<Color>(Colors.lightGreen[300])
                  : AlwaysStoppedAnimation<Color>(
                      ClarifyColors.clarifyAccent[50]),
            ),
            SizedBox(height: 5),
            Text(
              "Maximum Concentration: " +
                  report.upperBound.toString() +
                  report.unitAbbreviation,
              style: TextStyle(color: ClarifyColors.clarifyEarth[900]),
            ),
          ],
        ),
      ),
    ),
    onPressed: onPressed,
  );
}
