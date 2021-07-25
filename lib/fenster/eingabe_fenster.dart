import 'package:bmi_rechner/components/knopf_widget.dart';
import 'package:bmi_rechner/constants.dart';
import 'package:bmi_rechner/fenster/ergebnis_fenster.dart';
import 'package:bmi_rechner/rechner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EingabeFenster extends StatefulWidget {
  @override
  _EingabeFensterState createState() => _EingabeFensterState();
}

class _EingabeFensterState extends State<EingabeFenster> {
  String geschlecht = 'maennlich';
  int groesse = 180;
  int gewicht = 70;
  int alter = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI-Rechner',
          style: kAppBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  KnopfWidget(
                    farbe: geschlecht == kMaennlich
                        ? kButtonGedruecktFarbe
                        : kButtonNichtGedruecktFarbe,
                    istGedrueckt: () {
                      setState(() {
                        geschlecht = kMaennlich;
                      });
                    },
                    knopfInhalt: Icon(
                      FontAwesomeIcons.male,
                      size: 70,
                      color: kMaennlichFarbe,
                    ),
                  ),
                  KnopfWidget(
                    farbe: geschlecht == kWeiblich
                        ? kButtonGedruecktFarbe
                        : kButtonNichtGedruecktFarbe,
                    istGedrueckt: () {
                      setState(() {
                        geschlecht = kWeiblich;
                      });
                    },
                    knopfInhalt: Icon(
                      FontAwesomeIcons.female,
                      size: 70,
                      color: kWeiblichFarbe,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Alter',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                alter.toString(),
                                style: TextStyle(
                                  fontSize: 60,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Slider(
                        value: alter.toDouble(),
                        min: 0.0,
                        max: 100.0,
                        onChanged: (double newValue) {
                          setState(() {
                            alter = newValue.round();
                          });
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF3E3E4C),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Größe',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                groesse.toString(),
                                style: TextStyle(
                                  fontSize: 60,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'cm',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Slider(
                        value: groesse.toDouble(),
                        min: 20.0,
                        max: 200.0,
                        onChanged: (double newValue) {
                          setState(() {
                            groesse = newValue.round();
                          });
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF3E3E4C),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Gewicht',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                gewicht.toString(),
                                style: TextStyle(
                                  fontSize: 60,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'kg',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Slider(
                        value: gewicht.toDouble(),
                        min: 20.0,
                        max: 200.0,
                        onChanged: (double newValue) {
                          setState(() {
                            gewicht = newValue.round();
                          });
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF3E3E4C),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            KnopfWidget(
              farbe: kButtonNichtGedruecktFarbe,
              istGedrueckt: () {
                Rechner ergebnis = Rechner(
                  geschlecht: geschlecht.toString(),
                  alter: alter,
                  groesse: groesse,
                  gewicht: gewicht,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ErgebnisFenster(
                      bmiErgebnis: ergebnis.bmiRechner(),
                      bmiFarbe: ergebnis.getFarbe(),
                      bmiText: ergebnis.getBMIText(),
                    ),
                  ),
                );
              },
              knopfInhalt: Icon(
                FontAwesomeIcons.play,
                size: 70,
                color: Color(0xFF55B945),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
