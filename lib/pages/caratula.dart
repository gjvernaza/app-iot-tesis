import 'package:app_iot_tesis/pages/home_page.dart';
import 'package:flutter/material.dart';

class Caratula extends StatelessWidget {
  const Caratula({super.key});

  static String nameRouteCaratula = 'caratula';

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    );
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 150),
            SizedBox(
              width: 350,
              child: Image.asset('lib/images/Sellos.png'),
            ),
            const SizedBox(height: 35),
            SizedBox(
              //height: 200,
              //width: 1000,
              child: Image.asset('lib/images/brazo.gif'),
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                SizedBox(
                  height: 100,
                  child: Text(
                    'MIOHAND 4.0 \nMódulo de aprendizaje con sensores \nmioeléctricos y aplicaciones \nen la industria 4.0',
                    style: style,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 90),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage.nameRouteHome);
                    },
                    child: const Text('Iniciar'),
                  ),
                ),
                const SizedBox(width: 90),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
