import 'package:android_ios_test/pages/home.dart';
import 'package:android_ios_test/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const MaterialApp(home: Home()),
    );
  }
}
