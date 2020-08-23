import 'package:clarify_flutter/clarify_colors.dart';
import 'package:clarify_flutter/home_page.dart';
import 'package:clarify_flutter/login_page.dart';
import 'package:flutter/material.dart';
import 'package:clarify_flutter/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(ClarifyNS());
}

class ClarifyNS extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clarify NS',
      theme: ThemeData(
        primarySwatch: ClarifyColors.clarifyPrimary,
        accentColor: ClarifyColors.clarifyAccent,

        fontFamily: 'Lucida Fax',
        // TODO: We can probably define our TextTheme here and have it
        //  automatically work across the app rather than defining custom
        //  components for each text style. Probably a matter of preference,
        //  both options are viable.
        textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontFamily: 'Avant-Garde-Gothic',
              color: ClarifyColors.clarifyTertiary[500],
              fontFamilyFallback: ['Arial'],
            ),
            headline2: TextStyle(
                fontSize: 36.0,
                fontFamily: 'Avant-Garde-Gothic',
                fontFamilyFallback: ['Arial']),
            headline3: TextStyle(
                fontSize: 24,
                fontFamily: 'Avant-Garde-Gothic',
                fontFamilyFallback: ['Arial']),
            bodyText1: TextStyle(
                fontSize: 16,
                fontFamily: 'Avant-Garde-Gothic',
                fontFamilyFallback: ['Arial'])),

        // Adapt the density to the platform (denser on web).
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
