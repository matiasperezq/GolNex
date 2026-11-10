import 'package:flutter/material.dart';
import 'package:integrador/src/utils/barra_inferior.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verdeGolNex,
        title: Text('GolNex'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/map.png'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              _buscador(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: crearBarraInferior(context, 0),
    );
  }



  Widget _buscador() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.white),
      child: TextField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
            hintText: 'Buscar...',
            suffixIcon: Icon(Icons.search)),
      ),
    );
  }
}