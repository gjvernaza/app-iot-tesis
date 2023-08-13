import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Sensores extends StatelessWidget {
  final double emgBasico;
  final double myoWare;

  const Sensores({
    super.key,
    required this.emgBasico,
    required this.myoWare,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 350,
          child: Image.asset("lib/images/Señal EMG.png"),
        ),
        const Text("EMG BÁSICO"),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 150,
              child: Image.asset("lib/images/Sensor EMG.jpg"),
            ),
            const SizedBox(width: 30),
            CircularPercentIndicator(
              startAngle: 270,
              radius: 70.0,
              lineWidth: 15.0,
              percent: emgBasico / 100,
              center: Text(
                emgBasico < 10
                    ? '${emgBasico.toInt() * 100} uV'
                    : '${emgBasico.toInt() / 10} mV',
                style: const TextStyle(fontSize: 16),
              ),
              progressColor: Colors.blue,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text("MYO WARE"),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 150,
              child:
                  Image.asset("lib/images/myo_ware.jpg", fit: BoxFit.contain),
            ),
            const SizedBox(width: 30),
            CircularPercentIndicator(
              startAngle: 270,
              radius: 70.0,
              lineWidth: 15.0,
              percent: myoWare / 100,
              center: Text(
                myoWare < 10
                    ? '${myoWare.toInt() * 100} uV'
                    : '${myoWare.toInt() / 10} mV',
                style: const TextStyle(fontSize: 16),
              ),
              progressColor: Colors.red,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ],
    );
  }
}
