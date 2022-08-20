import 'package:flutter/material.dart';
import 'package:sentiment_analysis/constants.dart';
import 'package:flutter/services.dart';
import 'package:sentiment_analysis/screens/input_page.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Hero(
                tag: title,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    title,
                    style: splashFont,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              style: buttonStyle,
              onPressed: () {
                Navigator.pushNamed(context, InputPage.id);
              },
              child: const Text(
                'Welcome',
                style: myFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
