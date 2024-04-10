import 'package:animations/pages/durations/md3_durations_page.dart';
import 'package:animations/pages/rotations/rotations_page.dart';
import 'package:animations/pages/chained_animations/chained_animations_page.dart';
import 'package:animations/pages/curves/curves_page.dart';
import 'package:animations/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        return switch (settings.name) {
          RotationsPage.routeName => MaterialPageRoute(
              builder: (context) => const RotationsPage(),
            ),
          HomePage.routeName => MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          CurvesPage.routeName => MaterialPageRoute(
              builder: (context) => const CurvesPage(),
            ),
          ChainedAnimationsPage.routeName => MaterialPageRoute(
              builder: (context) => const ChainedAnimationsPage(),
            ),
          MD3DurationsPage.routeName => MaterialPageRoute(
              builder: (context) => const MD3DurationsPage(),
            ),
          _ => MaterialPageRoute(builder: (context) => const HomePage()),
        };
      },
    );
  }
}
