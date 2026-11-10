import 'package:flutter/material.dart';
import 'package:integrador/src/utils/barra_inferior.dart';


class CrearPartidoPage extends StatefulWidget {
  const CrearPartidoPage({super.key});

  @override
  State<CrearPartidoPage> createState() => _CrearPartidoPageState();
}

class _CrearPartidoPageState extends State<CrearPartidoPage> {
  TextEditingController _canchaController = new TextEditingController();
  TextEditingController _fechaController = new TextEditingController();


  double _faltan = 2.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verdeGolNex,
        title: Text('Crear partido'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearCancha(),
          Divider(),
          _crearFecha(context),
          Divider(),
          Text('Jugadores que faltan: ${_faltan.round()}'),
          _crearSlider(),
          SizedBox(height: 10.0),
          ElevatedButton(
            child: Text('Crear partido'),
            onPressed: () => _mostrarAlerta(context),
          ),
        ],
      ),
      bottomNavigationBar: crearBarraInferior(context, 1),
    );
  }

  Widget _crearCancha() {
    return TextField(
      controller: _canchaController,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Zona, barrio o cancha',
          labelText: 'Cancha',
          suffixIcon: Icon(Icons.place),
          icon: Icon(Icons.sports_soccer)),
    );
  }



  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _fechaController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Fecha del partido',
          labelText: 'Fecha del partido',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? calendario = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now(),
        lastDate: new DateTime(2027));

    if (calendario != null) {
      setState(() {
        _fechaController.text =
            '${calendario.day}/${calendario.month}/${calendario.year}';
      });
    }
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.green,
        label: 'Jugadores que faltan',
        divisions: 10,
        value: _faltan,
        min: 0.0,
        max: 10.0,
        onChanged: (valor) {
          setState(() {
            _faltan = valor;
          });
        });
  }


  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Partido creado'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Cancha: ${_canchaController.text}'),
                Text('Fecha: ${_fechaController.text}'),
                Text('Faltan: ${_faltan.round()} jugadores'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}