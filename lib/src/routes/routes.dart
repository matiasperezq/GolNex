import 'package:flutter/material.dart';
import 'package:integrador/src/pages/crear_partido_page.dart';
import 'package:integrador/src/pages/home_page.dart';
import 'package:integrador/src/pages/login.dart';


Map<String, WidgetBuilder> getAplicationRoutes() {
  return {
    '/': (BuildContext context) => LoginPage(),
    'mapa': (BuildContext context) => HomePage(),
    'crear': (BuildContext context) => CrearPartidoPage(),
  };
}