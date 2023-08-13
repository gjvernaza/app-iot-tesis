import 'package:app_iot_tesis/pages/caratula.dart';
import 'package:app_iot_tesis/pages/home_page.dart';
import 'package:app_iot_tesis/providers/ui_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
//import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UiProvider()),
      ],
      child: MaterialApp(
        title: 'MioHand 4.0',
        debugShowCheckedModeBanner: false,
        initialRoute: 'caratula',
        routes: {
          'caratula': (context) => const Caratula(),
          'home_page': (context) => const HomePage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 4, 95, 4)),
          useMaterial3: true,
        ),
      ),
    );
  }
}
