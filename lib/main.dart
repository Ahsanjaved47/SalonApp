import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/splash_screen.dart';

import 'screens/home_screen.dart';

void main() {

    runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child:MaterialApp(
      title: 'Beauty App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const SplashScreen(),
    )
    );
  }
}
