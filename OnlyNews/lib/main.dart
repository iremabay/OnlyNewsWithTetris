import 'package:flutter/material.dart';
import 'package:onlynews/firstpage.dart';
import 'package:onlynews/pages/userinput.dart';
import 'package:onlynews/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlynews/pages/home.dart';
import 'package:onlynews/utils/routes.dart';
import 'package:onlynews/widgets/drawer.dart';

void main() async {
  // Initializing Hive
  await Hive.initFlutter();
  var highbox = await Hive.openBox("HighScore_db");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: const firstpage(),
          ),
        ),
        Myroutes.drawerRoute: (context) => DrawerPage(),
        "/tetris": (context) => HomePage(),
      },
    );
  }
}