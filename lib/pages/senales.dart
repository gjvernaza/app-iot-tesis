import 'package:app_iot_tesis/widgets/sensores.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Senales extends StatefulWidget {
  final String title;
  const Senales({super.key, required this.title});

  @override
  State<Senales> createState() => _SenalesState();
}

class _SenalesState extends State<Senales> {
  double _emgBasico = 0;
  double _myoWare = 0;

  final _db = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _readData();
  }

  _readData() {
    _db.child('sensores/emg_basico').onValue.listen((event) {
      final sensor1 = event.snapshot.value.toString();
      setState(() {
        _emgBasico = double.parse(sensor1);
      });
    });
    _db.child('sensores/myo_ware').onValue.listen((event) {
      final sensor2 = event.snapshot.value.toString();
      setState(() {
        _myoWare = double.parse(sensor2);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Sensores(emgBasico: _emgBasico, myoWare: _myoWare),
      ),
    );
  }
}
