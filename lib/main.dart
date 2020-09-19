import 'dart:io';

import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:clarify_flutter/loading_page.dart';
import 'package:clarify_flutter/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(ClarifyNS());
}

class ClarifyNS extends StatelessWidget {
  // This widget is the root of your application.-
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // TODO: Actually let the user know that we failed.
          exit(1);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          title: 'Clarify is Loading...',
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
          home: LoadingPage(),
        );
      },
    );
  }
}
