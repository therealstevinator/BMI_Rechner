import 'package:flutter/material.dart';

class KnopfWidget extends StatelessWidget {
  KnopfWidget({@required this.farbe, this.knopfInhalt, this.istGedrueckt});

  final Color farbe;
  final Widget knopfInhalt;
  final Function istGedrueckt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: istGedrueckt,
      child: Container(
        child: knopfInhalt,
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: farbe,
          borderRadius: BorderRadius.circular(70.0),
        ),
      ),
    );
  }
}
