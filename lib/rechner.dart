import 'dart:math';
import 'package:bmi_rechner/constants.dart';
import 'package:flutter/material.dart';

class Rechner {
  Rechner({this.geschlecht, this.alter, this.groesse, this.gewicht});

  final String geschlecht;
  final int alter;
  final int groesse;
  final int gewicht;
  double _bmi;

  String bmiRechner() {
    _bmi = gewicht / pow(groesse / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIText() {
    if (geschlecht == kWeiblich) {
      if (_bmi >= 25) {
        return 'Übergewicht > 25';
      } else if (_bmi >= 19) {
        return 'Normal 19 - 24';
      } else {
        return 'Untergewicht < 19';
      }
    } else {
      if (_bmi >= 26) {
        return 'Übergewicht > 26';
      } else if (_bmi >= 20) {
        return 'Normal 20 - 25';
      } else {
        return 'Untergewicht < 20';
      }
    }
  }

  Color getFarbe() {
    if (geschlecht == kWeiblich) {
      if (_bmi >= 25) {
        return kUebergewichtFarbe;
      } else if (_bmi >= 19) {
        return kNormalgewichtFarbe;
      } else {
        return kUntergewichtFarbe;
      }
    } else {
      if (_bmi >= 26) {
        return kUebergewichtFarbe;
      } else if (_bmi > 20) {
        return kNormalgewichtFarbe;
      } else {
        return kUntergewichtFarbe;
      }
    }
  }
}
