import 'package:clarify_flutter/model/contaminant_info.dart';
import 'package:clarify_flutter/shared_components/clarify_colors.dart';
import 'package:clarify_flutter/shared_components/clarify_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContaminantPage extends StatelessWidget {
  final String contaminantName;
  ContaminantPage(this.contaminantName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClarifyColors.clarifyAppBarColor,
        title: Text(
          contaminantName.toUpperCase(),
          style: TextStyle(
            color: ClarifyColors.clarifyTertiary[50],
            fontFamily: 'Avant-Garde-Gothic',
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        decoration: clarifyBackgroundDecoration(),
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            FutureBuilder<ContaminantInfo>(
                future: getContaminantInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> paragraphs = [];
                    for (var paragraph in snapshot.data.paragraphs) {
                      paragraphs.add(Text(
                        paragraph,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Century-Gothic',
                          color: ClarifyColors.clarifyPrimary[900],
                        ),
                      ));
                      paragraphs.add(SizedBox(height: 20));
                    }
                    return Column(children: paragraphs);
                  } else if (snapshot.hasError) {
                    return Text("There was an error while loading this info.");
                  }
                  return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }

  Future<ContaminantInfo> getContaminantInfo() {
    return FirebaseFirestore.instance
        .collection('contaminant_info')
        .doc(this.contaminantName)
        .get()
        .then((value) {
      return ContaminantInfo.fromMap(value.data(), value.id, contaminantName);
    });
  }
}
