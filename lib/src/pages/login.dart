import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GolNex'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          _crearLogo(),
          SizedBox(height: 40),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          SizedBox(height: 30),
          _crearBoton(),
        ],
      ),
    );
  }

  Widget _crearLogo() {
    return const CircleAvatar(
      radius: 50.0,
      backgroundColor: Colors.green,
      child: Icon(Icons.sports_soccer, size: 50, color: Colors.white),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'ejemplo@correo.com',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email, color: Colors.green),
        icon: Icon(Icons.email, color: Colors.green),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Contraseña',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open, color: Colors.green),
        icon: Icon(Icons.lock, color: Colors.green),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  Widget _crearBoton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text('INGRESAR',
          style: TextStyle(color: Colors.white, fontSize: 16)),
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'mapa');
        print('Email ingresado: $_email');
        print('Password ingresada: $_password');
      },
    );
  }
}