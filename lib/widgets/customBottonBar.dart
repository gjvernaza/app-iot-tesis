import 'package:app_iot_tesis/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CustomBottonNavigatorBar extends StatelessWidget {
  const CustomBottonNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuOpt;
    return BottomNavigationBar(
        onTap: (int index) => uiProvider.selectMenuOpt = index,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sensors_outlined), label: 'Señales'),
          BottomNavigationBarItem(
              icon: Icon(Icons.precision_manufacturing_outlined),
              label: 'Manipulador'),
          BottomNavigationBarItem(
              icon: Icon(Icons.memory_outlined), label: 'Operación'),
        ]);
  }
}
