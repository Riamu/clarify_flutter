import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:clarify_flutter/shared_components/clarify_ui.dart';
import 'package:clarify_flutter/custom_widgets/contaminant_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn about well water safety.'),
        backgroundColor: ClarifyColors.clarifyAppBarColor,
      ),
      body: Container(
        decoration: clarifyBackgroundDecoration(),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            clarifyRaisedButton(
              "Arsenic",
              () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return ContaminantPage('arsenic');
                }));
              },
              subtext: "A potent and abundant toxin.",
              subtextColor: ClarifyColors.clarifySecondary[300],
            ),
            SizedBox(
              height: 20,
            ),
            clarifyRaisedButton(
              "Lead",
              () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return ContaminantPage('lead');
                }));
              },
              subtext: "Chronic exposure is a major risk.",
              subtextColor: ClarifyColors.clarifySecondary[300],
            ),
            SizedBox(
              height: 20,
            ),
            clarifyRaisedButton(
              "Bacteria",
              () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return ContaminantPage('bacteria');
                }));
              },
              subtext: "Invisible microorganisms.",
              subtextColor: ClarifyColors.clarifySecondary[300],
            ),
          ],
        ),
      ),
    );
  }
}
