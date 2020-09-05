import 'package:clarify_flutter/clarify_colors.dart';
import 'package:clarify_flutter/model/contaminant_report.dart';
import 'package:flutter/material.dart';

/// Package for UI elements that have been custom styled for Clarify.

/// A RaisedButton appropriate for the main action on a view.
RaisedButton clarifyRaisedButton(String text, Function onPressed) {
  return RaisedButton(
    splashColor: ClarifyColors.clarifySecondary,
    color: ClarifyColors.clarifyTertiary,
    onPressed: onPressed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Century-Gothic',
              fontSize: 20,
              color: ClarifyColors.clarifyPrimary[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

/// A text style appropriate for most headings in content views.
TextStyle clarifyHeading() {
  return TextStyle(
      fontFamily: 'Lucida-Fax',
      fontSize: 25,
      color: ClarifyColors.clarifyTertiary,
      fontWeight: FontWeight.bold);
}

/// A 'sign in with google' button styled for Clarify
RaisedButton googleSignInButton(Function onPressed) {
  return RaisedButton(
    splashColor: ClarifyColors.clarifySecondary,
    color: ClarifyColors.clarifyTertiary,
    onPressed: onPressed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    highlightElevation: 0,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}

/// A gradient decoration in clarify colours.
BoxDecoration clarifyGradientBox() {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          ClarifyColors.clarifyPrimary[50],
          ClarifyColors.clarifyPrimary[900],
        ]),
  );
}

Widget clarifyContaminantIndicator(
    ContaminantReport report, Function onPressed) {
  return RaisedButton(
    color: ClarifyColors.clarifyPrimary,
    splashColor: ClarifyColors.clarifyAccent,
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
              color: ClarifyColors.clarifyTertiary[100],
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
                ? AlwaysStoppedAnimation<Color>(Colors.lightGreen)
                : AlwaysStoppedAnimation<Color>(ClarifyColors.clarifyAccent),
          ),
          SizedBox(height: 5),
          Text(
            "Maximum Concentration: " +
                report.upperBound.toString() +
                report.unitAbbreviation,
            style: TextStyle(color: ClarifyColors.clarifyEarth[50]),
          ),
        ],
      ),
    ),
    onPressed: onPressed,
  );
}
