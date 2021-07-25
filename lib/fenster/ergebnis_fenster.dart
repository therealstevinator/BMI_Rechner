import 'package:bmi_rechner/components/knopf_widget.dart';
import 'package:bmi_rechner/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErgebnisFenster extends StatelessWidget {
  ErgebnisFenster({
    @required this.bmiErgebnis,
    @required this.bmiFarbe,
    @required this.bmiText,
  });

  final String bmiErgebnis;
  final Color bmiFarbe;
  final String bmiText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ergebnis',
          style: kAppBarTextStyle,
        ),
        //remove the back button
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: bmiFarbe,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: kHintergrundFarbe,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  bmiErgebnis,
                  style: TextStyle(
                    fontSize: 90,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                bmiText,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            KnopfWidget(
              farbe: kButtonNichtGedruecktFarbe,
              istGedrueckt: () {
                Navigator.pop(context);
              },
              knopfInhalt: Icon(
                FontAwesomeIcons.reply,
                size: 70,
                color: Color(0xFF0047FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
