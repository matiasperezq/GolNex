import 'package:flutter/material.dart';


const Color verdeGolNex = Colors.green;


Widget crearBarraInferior(BuildContext context, int activo) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _itemBarra(context, Icons.location_on, 'Mapa', 'mapa', activo == 0),
        _itemBarra(context, Icons.add_circle_outline, 'Crear partido', 'crear',
            activo == 1),
      ],
    ),
  );
}

Widget _itemBarra(BuildContext context, IconData icono, String texto,
    String ruta, bool esActivo) {
  final color = esActivo ? verdeGolNex : Colors.grey;
  return TextButton(
    onPressed: () {
      if (!esActivo) {
        Navigator.pushReplacementNamed(context, ruta);
      }
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, color: color),
        Text(texto, style: TextStyle(color: color, fontSize: 12.0)),
      ],
    ),
  );
}