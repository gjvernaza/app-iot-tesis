import 'package:app_iot_tesis/pages/manipulador.dart';
import 'package:app_iot_tesis/pages/operacion.dart';
import 'package:app_iot_tesis/pages/senales.dart';
import 'package:app_iot_tesis/widgets/customBottonBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String nameRouteHome = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeBody(),
      bottomNavigationBar:
          CustomBottonNavigatorBar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuOpt;

    switch (currentIndex) {
      case 0:
        return const Senales(title: 'Señales Musculares');

      case 1:
        return const Manipulador(title: 'Manipulador');

      case 2:
        return const Operacion(title: 'Operación');

      default:
        return const Senales(title: 'Señales Musculares');
    }
  }
}
