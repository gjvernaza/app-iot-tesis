import 'package:app_iot_tesis/widgets/silder_firebase.dart';
import 'package:flutter/material.dart';

class Manipulador extends StatefulWidget {
  final String title;
  const Manipulador({super.key, required this.title});

  @override
  State<Manipulador> createState() => _ManipuladorState();
}

class _ManipuladorState extends State<Manipulador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: SliderFirebase(),
      ),
    );
  }
}
