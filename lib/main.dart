import 'package:bmi_rechner/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'fenster/eingabe_fenster.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(BMIRechner()));
}

class BMIRechner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kHintergrundFarbe,
        scaffoldBackgroundColor: kHintergrundFarbe,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Sansation',
              bodyColor: Colors.white,
            ),
      ),
      home: EingabeFenster(),
    );
  }
}
