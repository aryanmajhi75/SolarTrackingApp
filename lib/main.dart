import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solar/firebase_options.dart';
import 'package:solar/themes/textTheme.dart';
import 'package:solar/views/Navbar.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  //initialized firebase
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        textTheme: AppTextTheme.textTheme,
      ),
      home: Navbar(),
    );
  }
}