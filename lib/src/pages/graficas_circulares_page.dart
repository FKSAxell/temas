import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temas/src/widgets/radial_progress.dart';

import '../theme/theme.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  final Gradient gradiente = new LinearGradient(
      colors: <Color>[Color(0xffC012FF), Color(0xff6D05E8), Colors.red]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0;
              }
            });
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadiaProgress(
                  porcentaje: porcentaje,
                  color: Colors.blue,
                ),
                CustomRadiaProgress(
                  porcentaje: porcentaje * 1.2,
                  color: Colors.red,
                  gradiente: gradiente,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadiaProgress(
                    porcentaje: porcentaje * 1.4, color: Colors.pink),
                CustomRadiaProgress(
                    porcentaje: porcentaje * 1.6, color: Colors.purple),
              ],
            )
          ],
        ));
  }
}

class CustomRadiaProgress extends StatelessWidget {
  final Color color;
  final Gradient gradiente;
  const CustomRadiaProgress(
      {@required this.porcentaje, @required this.color, this.gradiente});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
        width: 180,
        height: 180,
        child: RadialProgress(
          porcentaje: porcentaje,
          colorPrimario: color,
          colorSecundario: appTheme.textTheme.bodyText2.color,
          grosorPrimario: 10,
          grosorSecundario: 4,
          colorPrimarioGradiente: gradiente,
        ));
  }
}
