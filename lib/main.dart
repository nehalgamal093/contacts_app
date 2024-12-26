import 'package:contacts_app/home_screen/home_screen.dart';
import 'package:contacts_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

void initialization() async {
  await Future.delayed(const Duration(milliseconds: 1000));
  FlutterNativeSplash.remove();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {HomeScreen.routeName: (context) => const HomeScreen()},
        theme: MyTheme.themeData);
  }
}
