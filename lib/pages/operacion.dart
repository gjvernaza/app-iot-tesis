import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Operacion extends StatefulWidget {
  final String title;
  const Operacion({super.key, required this.title});

  @override
  State<Operacion> createState() => _OperacionState();
}

class _OperacionState extends State<Operacion> {
  final _db = FirebaseDatabase.instance.ref('manipulador');
  final _dbSensor = FirebaseDatabase.instance.ref('sensores');

  double value = 0;
  double valueEmg = 0;
  double valueMyo = 0;
  double valueFirebase = 0;
  bool valuePulse = true;
  String _tipo = "";

  _readData() {
    _db.child('tipo').onValue.listen((event) {
      final tipo = event.snapshot.value.toString();
      setState(() {
        _tipo = tipo;
      });
    });
    _db.child('dedo1').onValue.listen((event) {
      final v1 = event.snapshot.value.toString();
      setState(() {
        valueFirebase = double.parse(v1) / 100;
        //print(value1);
      });
    });
  }

  uploadValueSlider(double value) async {
    if (_tipo == "cell") {
      await _db.update({
        "dedo1": (value * 100).toInt(),
        "dedo2": (value * 100).toInt(),
        "dedo3": (value * 100).toInt(),
        "dedo4": (value * 100).toInt(),
        "dedo5": (value * 100).toInt(),
        "dedo6": (value * 100).toInt(),
      });
    }
  }

  uploadEmg(double value) async {
    if (_tipo == "cell") {
      await _dbSensor.update({
        "emg_basico": (value * 100).toInt(),
      });
    }
  }

  uploadMyo(double value) async {
    if (_tipo == "cell") {
      await _dbSensor.update({
        "myo_ware": (value * 100).toInt(),
      });
    }
  }

  uploadPulse(bool value) async {
    if (_tipo == "cell") {
      await _db.update({
        "pulso": value,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _readData();
    //uploadValueSlider(value);
    //_cargarPrefs();
  }

  //_cargarPrefs() async {
  //  final prefs = await SharedPreferences.getInstance();
//
  //  setState(() {
  //    value = prefs.getDouble('value') ?? 0;
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset("lib/images/mano_robot.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            uploadValueSlider(1);
                          },
                          child: const Text('Abrir'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            uploadValueSlider(0);
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 350),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            uploadPulse(valuePulse);
                            valuePulse = !valuePulse;
                          },
                          child: const Text('Pulso'),
                        ),
                        Text(
                          _tipo == "esp32"
                              ? '${(valueFirebase * 100).toInt()} %'
                              : '${(value * 100).toInt()} %',
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 60, child: Text("Máximo")),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Slider(
                                value: _tipo == "esp32" ? valueFirebase : value,
                                onChanged: (v) async {
                                  //final prefs = await SharedPreferences.getInstance();
                                  setState(() {
                                    if (_tipo == "cell") {
                                      value = v;
                                    }
                                    uploadValueSlider(value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _tipo == "esp32"
                              ? '${(valueFirebase * 100).toInt()} %'
                              : '${(valueEmg * 100).toInt()} %',
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 60, child: Text("Emg")),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Slider(
                                value:
                                    _tipo == "esp32" ? valueFirebase : valueEmg,
                                onChanged: (v) async {
                                  //final prefs = await SharedPreferences.getInstance();
                                  setState(() {
                                    if (_tipo == "cell") {
                                      valueEmg = v;
                                    }
                                    uploadEmg(valueEmg);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _tipo == "esp32"
                              ? '${(valueFirebase * 100).toInt()} %'
                              : '${(valueMyo * 100).toInt()} %',
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 60, child: Text("Myo")),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Slider(
                                value:
                                    _tipo == "esp32" ? valueFirebase : valueMyo,
                                onChanged: (v) async {
                                  //final prefs = await SharedPreferences.getInstance();
                                  setState(() {
                                    if (_tipo == "cell") {
                                      valueMyo = v;
                                    }
                                    uploadMyo(valueMyo);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
