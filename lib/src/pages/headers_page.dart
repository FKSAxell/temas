import 'package:provider/provider.dart';
import 'package:temas/src/widgets/headers.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.accentColor;
    return Scaffold(
      body: HeaderWave(color: accentColor),
    );
  }
}
