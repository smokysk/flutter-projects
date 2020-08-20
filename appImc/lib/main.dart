import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'calculateImc',
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String _info = "Insira seus dados";

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppImc'),
        backgroundColor: Colors.indigo,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _clearAll();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(right: 10.0, left: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.indigo,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.green, fontSize: 30),
                controller: nameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "digite seu nome";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Peso(KG)',
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 30),
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Digite seu peso";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Altura(cm)',
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 30),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Digite sua altura";
                  }
                },
              ),
              Container(
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    child: Text(
                      'calcular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    color: Colors.indigo,
                  ),
                ),
              ),
              Text(
                _info,
                style: TextStyle(color: Colors.indigo, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearAll() {
    setState(() {
      heightController.text = "";
      weightController.text = "";
      nameController.text = "";
      _info = "digite seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      String name = nameController.text;
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / pow(height, 2);

      if (imc < 18.5) {
        _info = " $name seu abaixo do peso ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _info = " $name seu peso ideial ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 24.9 && imc < 29.9) {
        _info = "vai malhar gordão ${imc.toStringAsPrecision(4)}";
      } else {
        _info = " $name procure um guindaste ou um aras";
      }
    });
  }
}
