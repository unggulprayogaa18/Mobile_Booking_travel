import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uts_hotel_puputunggulprayoga/screens/login_screen.dart';
import 'gen/colors.gen.dart';
import 'gen/fonts.gen.dart';
import 'screens/home_screen.dart';

// Add these imports for Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Assuming this file is in the same directory

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await initializeFirebase(); // Initialize Firebase before runApp
  runApp(const ProviderScope(child: HotelApp()));
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class HotelApp extends StatelessWidget {
  const HotelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hotel App UI',
      theme: ThemeData(
        fontFamily: FontFamily.workSans,
        primarySwatch: ColorName.primarySwatch,
      ),
      home:  LoginPage(),
    );
  }
}
