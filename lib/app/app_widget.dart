import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:newgram/app/dark_theme.dart';
import 'package:newgram/app/ligth_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ligthTheme,
      darkTheme: darkTheme,
      // Escolhe o thema a seguir
      themeMode: ThemeMode.system,
    ).modular();
  }
}