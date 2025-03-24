import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar/firebase_options.dart';
import 'package:solar/providers/user_provider.dart';
import 'package:solar/themes/textTheme.dart';
import 'package:solar/views/Login.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  //initialized firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: AppTextTheme.textTheme,
      ),
      home: Login(),
    );
  }
}