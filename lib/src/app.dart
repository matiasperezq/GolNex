import 'package:flutter/material.dart';
import 'package:integrador/src/routes/routes.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GolNex',
      initialRoute: '/',
      routes: getAplicationRoutes(),
    );
  }
}
