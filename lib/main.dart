import 'package:flutter/material.dart';
import 'package:sentiment_analysis/screens/splash_screen.dart';
import 'constants.dart';
import './screens/input_page.dart';

void main() {
  runApp(const SentimentAnalysis());
}

class SentimentAnalysis extends StatelessWidget {
  const SentimentAnalysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: mainColor,
        ),
        scaffoldBackgroundColor: mainColor,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        InputPage.id: (context) => InputPage(),
      },
    );
  }
}
