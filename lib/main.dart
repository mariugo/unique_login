import 'package:flutter/material.dart';
import 'presentation/ui/screens/splash_screen.dart';
import 'presentation/ui/screens/home_screen.dart';

main() => runApp(
      SplashScreen(
          key: UniqueKey(),
          onInitializationComplete: () {
            runApp(const MyApp());
          }),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
