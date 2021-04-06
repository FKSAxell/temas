import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:temas/src/routes/routes.dart';
import 'package:temas/src/theme/theme.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (appTheme.darkTheme)
            ? Colors.black12
            : appTheme.currentTheme.primaryColor,
        centerTitle: true,
        title: Text('Diseños en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(color: appTheme.primaryColor),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.accentColor,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'AK',
                    style: TextStyle(
                      fontSize: 50,
                      color: (appTheme.darkTheme)
                          ? Colors.white
                          : appTheme.currentTheme.textTheme.bodyText2.color,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: accentColor,
                  value: appTheme.customTheme,
                  onChanged: (value) => appTheme.customTheme = value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
