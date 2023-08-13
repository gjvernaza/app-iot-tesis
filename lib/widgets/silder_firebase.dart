import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SliderFirebase extends StatefulWidget {
  const SliderFirebase({super.key});

  @override
  State<SliderFirebase> createState() => _SliderFirebase();
}

class _SliderFirebase extends State<SliderFirebase> {
  final _db = FirebaseDatabase.instance.ref('manipulador');
  final _dbTipo = FirebaseDatabase.instance.ref();

  double newValue1 = 0;
  double newValue2 = 0;
  double newValue3 = 0;
  double newValue4 = 0;
  double newValue5 = 0;
  double newValue6 = 0;

  double value1 = 0;
  double value2 = 0;
  double value3 = 0;
  double value4 = 0;
  double value5 = 0;
  double value6 = 0;

  String _tipo = '';

  uploadDataDedo1(double value) async {
    await _db.update({
      if (_tipo == "cell") "dedo1": (value * 100).toInt(),
    });
  }

  uploadDataDedo2(double value) async {
    await _db.update({
      if (_tipo == "cell") "dedo2": (value * 100).toInt(),
    });
  }

  uploadDataDedo3(double value) async {
    await _db.update({
      if (_tipo == "cell") "dedo3": (value * 100).toInt(),
    });
  }

  uploadDataDedo4(double value) async {
    await _db.update({
      if (_tipo == "cell") "dedo4": (value * 100).toInt(),
    });
  }

  uploadDataDedo5(double value) async {
    await _db.update({
      if (_tipo == "cell") "dedo5": (value * 100).toInt(),
    });
  }

  uploadDataDedo6(double value) async {
    await _db.update({
      if (_tipo == "cell") "dedo6": (value * 100).toInt(),
    });
  }

  @override
  void initState() {
    super.initState();
    _readData();
    //_cargarPrefs();
  }

  _readData() {
    _dbTipo.child('manipulador/tipo').onValue.listen((event) {
      final tipo = event.snapshot.value.toString();
      setState(() {
        _tipo = tipo;
      });
    });

    //if (_tipo == "esp32") {
    _dbTipo.child('manipulador/dedo1').onValue.listen((event) {
      final v1 = event.snapshot.value.toString();
      setState(() {
        value1 = double.parse(v1) / 100;
        //print(value1);
      });
    });
    _dbTipo.child('manipulador/dedo2').onValue.listen((event) {
      final v2 = event.snapshot.value.toString();
      setState(() {
        value2 = double.parse(v2) / 100;
      });
    });
    _dbTipo.child('manipulador/dedo3').onValue.listen((event) {
      final v3 = event.snapshot.value.toString();
      setState(() {
        value3 = double.parse(v3) / 100;
      });
    });
    _dbTipo.child('manipulador/dedo4').onValue.listen((event) {
      final v4 = event.snapshot.value.toString();
      setState(() {
        value4 = double.parse(v4) / 100;
      });
    });
    _dbTipo.child('manipulador/dedo5').onValue.listen((event) {
      final v5 = event.snapshot.value.toString();
      setState(() {
        value5 = double.parse(v5) / 100;
      });
    });
    _dbTipo.child('manipulador/dedo6').onValue.listen((event) {
      final v6 = event.snapshot.value.toString();
      setState(() {
        value6 = double.parse(v6) / 100;
      });
    });
    //}
  }

  //_cargarPrefs() async {
  //  final prefs = await SharedPreferences.getInstance();
//
  //  setState(() {
  //    newValue1 = prefs.getDouble('dedo1') ?? 0;
  //    newValue2 = prefs.getDouble('dedo2') ?? 0;
  //    newValue3 = prefs.getDouble('dedo3') ?? 0;
  //    newValue4 = prefs.getDouble('dedo4') ?? 0;
  //    newValue5 = prefs.getDouble('dedo5') ?? 0;
  //    newValue6 = prefs.getDouble('dedo6') ?? 0;
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/mano_servo.jpg', fit: BoxFit.cover),
        //Dedo 1
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Meñique'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('lib/images/dedo1.gif'),
                ),
              ],
            ),
            Column(
              children: [
                Text(_tipo == "esp32"
                    ? '${(value1 * 100).toInt()} %'
                    : '${(newValue1 * 100).toInt()} %'),
                Slider(
                    //activeColor: const Color.fromARGB(255, 25, 156, 25),
                    value: _tipo == "esp32" ? value1 : newValue1,
                    onChanged: (value) async {
                      //final prefs = await SharedPreferences.getInstance();
                      setState(() {
                        if (_tipo == "cell") {
                          newValue1 = value;
                        }
                        uploadDataDedo1(newValue1);
                        //prefs.setDouble("dedo1", newValue1);
                      });
                    }),
              ],
            ),
          ],
        ),

        //Dedo 2
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Anular'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('lib/images/dedo2.gif'),
                ),
              ],
            ),
            Column(
              children: [
                Text(_tipo == "esp32"
                    ? '${(value2 * 100).toInt()} %'
                    : '${(newValue2 * 100).toInt()} %'),
                Slider(
                    //activeColor: const Color.fromARGB(255, 25, 156, 25),
                    value: _tipo == "esp32" ? value2 : newValue2,
                    onChanged: (value) async {
                      //final prefs = await SharedPreferences.getInstance();
                      setState(() {
                        if (_tipo == "cell") {
                          newValue2 = value;
                        }
                        uploadDataDedo2(newValue2);
                        //prefs.setDouble("dedo2", newValue2);
                      });
                    }),
              ],
            ),
          ],
        ),

        //Dedo 3
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Medio'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('lib/images/dedo4.gif'),
                ),
              ],
            ),
            Column(
              children: [
                Text(_tipo == "esp32"
                    ? '${(value3 * 100).toInt()} %'
                    : '${(newValue3 * 100).toInt()} %'),
                Slider(
                    //activeColor: const Color.fromARGB(255, 25, 156, 25),
                    value: _tipo == "esp32" ? value3 : newValue3,
                    onChanged: (value) async {
                      //final prefs = await SharedPreferences.getInstance();
                      setState(() {
                        if (_tipo == "cell") {
                          newValue3 = value;
                        }
                        uploadDataDedo3(newValue3);
                        //prefs.setDouble('dedo3', newValue3);
                      });
                    }),
              ],
            ),
          ],
        ),

        //Dedo 4
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('índice'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('lib/images/dedo4.gif'),
                ),
              ],
            ),
            Column(
              children: [
                Text(_tipo == "esp32"
                    ? '${(value4 * 100).toInt()} %'
                    : '${(newValue4 * 100).toInt()} %'),
                Slider(
                  //activeColor: const Color.fromARGB(255, 25, 156, 25),
                  value: _tipo == "esp32" ? value4 : newValue4,
                  onChanged: (value) async {
                    //final prefs = await SharedPreferences.getInstance();
                    setState(() {
                      if (_tipo == "cell") {
                        newValue4 = value;
                      }
                      uploadDataDedo4(newValue4);
                      //prefs.setDouble('dedo4', newValue4);
                    });
                  },
                ),
              ],
            ),
          ],
        ),

        // Dedo 5
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Pulgar'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('lib/images/dedo5.gif'),
                ),
              ],
            ),
            Column(
              children: [
                Text(_tipo == "esp32"
                    ? '${(value5 * 100).toInt()} %'
                    : '${(newValue5 * 100).toInt()} %'),
                Slider(
                    //activeColor: const Color.fromARGB(255, 25, 156, 25),
                    value: _tipo == "esp32" ? value5 : newValue5,
                    onChanged: (value) async {
                      //final prefs = await SharedPreferences.getInstance();
                      setState(() {
                        if (_tipo == "cell") {
                          newValue5 = value;
                        }
                        uploadDataDedo5(newValue5);
                        //prefs.setDouble('dedo5', newValue5);
                      });
                    }),
              ],
            ),
          ],
        ),

        // Dedo 6

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Articulación'),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('lib/images/dedo5.gif'),
                ),
              ],
            ),
            Column(
              children: [
                Text(_tipo == "esp32"
                    ? '${(value6 * 100).toInt()} %'
                    : '${(newValue6 * 100).toInt()} %'),
                Slider(
                    //activeColor: const Color.fromARGB(255, 25, 156, 25),
                    value: _tipo == "esp32" ? value6 : newValue6,
                    onChanged: (value) async {
                      //final prefs = await SharedPreferences.getInstance();
                      setState(() {
                        if (_tipo == "cell") {
                          newValue6 = value;
                        }
                        uploadDataDedo6(newValue6);
                        //prefs.setDouble('dedo6', newValue6);
                      });
                    }),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
