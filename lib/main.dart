import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/details_page.dart';
import 'pages/home_page.dart';
import 'src/models/character.dart';

void main() {
  runApp(const RMApp());
}

class RMApp extends StatelessWidget {
  const RMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kode Start R&M api',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeId:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return const HomePage();
              },
            );
          case DetailsPage.routeId:
            Character detailedCharacter = settings.arguments as Character;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return DetailsPage(detailedCharacter: detailedCharacter);
              },
            );
          default:
            return null;
        }
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
