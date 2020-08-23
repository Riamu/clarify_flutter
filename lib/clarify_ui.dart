import 'package:clarify_flutter/clarify_colors.dart';
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
