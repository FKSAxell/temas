import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temas/src/pages/launcher_page.dart';
import 'package:temas/src/theme/theme.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(1),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
      theme: currentTheme,
    );
  }
}
