import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList(),
          ),
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: (appTheme.darkTheme)
              ? MaterialStateProperty.all<Color>(
                  appTheme.currentTheme.accentColor)
              : MaterialStateProperty.all<Color>(Color(0xffED6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
              ),
            ),
          ),
        ),
        child: Container(
          height: size.height * 0.1,
          width: size.width * 0.8,
          child: Center(
            child: Text(
              'CREATE A NEW LIST',
              style: TextStyle(
                  color: appTheme.currentTheme.scaffoldBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text("Hola"),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 172,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...items,
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "New",
              style: TextStyle(
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
                fontSize: 50,
              ),
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: 100,
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: 140,
                  height: 4,
                  color: (appTheme.darkTheme) ? Colors.grey : Color(0xfff7cdd5),
                ),
              ),
              Container(
                child: Text(
                  "List",
                  style: TextStyle(
                    color: Color(0xffd93a30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
