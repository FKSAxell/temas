// import 'package:temas/src/pages/animaciones_page.dart';
// import 'package:temas/src/labs/circular_progressbar_page.dart';
// import 'package:temas/src/pages/emergency_page.dart';
// import 'package:temas/src/pages/graficas_circulares_page.dart';
// import 'package:temas/src/pages/headers_page.dart';
// import 'package:temas/src/labs/slideshow_page.dart';
// import 'package:temas/src/pages/pinterest_page.dart';
// import 'package:temas/src/pages/sliver_list_page.dart';
// import 'package:temas/src/retos/cuadrado_animado_page.dart';
// import 'src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temas/src/pages/launcher_page.dart';
import 'package:temas/src/theme/theme.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
    );
  }
}
