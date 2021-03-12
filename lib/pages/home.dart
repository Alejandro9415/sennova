import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senova/pages/convo.dart';
import 'package:senova/pages/widgets/widgets.dart';

import 'Inicio.dart';
import 'login.dart';
import 'mision.dart';
import 'vision.dart';

class HomPage extends StatefulWidget {
  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  PageController _pageController = PageController(initialPage: Pages.login);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void switchForm(int page) {
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styleNav = TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: MediaQuery.of(context).size.width < 600
            ? AppBar(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset('assets/bannerEncabezado.png'),
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
              )
            : CustomAppBar(
                height: 185,
                child: Column(
                  children: [
                    Image.asset('assets/bannerEncabezado.png'),
                    Nav(
                      width: double.infinity,
                      height: 80,
                      inicio: () => switchForm(Pages.inicio),
                      mision: () => switchForm(Pages.mision),
                      vision: () => switchForm(Pages.vision),
                      login: () => switchForm(Pages.login),
                    ),
                  ],
                ),
              ),
        drawer: Drawer(
          child: Container(
            color: Colors.green,
            child: Column(
              children: [
                TextButton(
                  onPressed: () => switchForm(Pages.inicio),
                  child: Text(
                    'Inicio',
                    style: styleNav,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => switchForm(Pages.mision),
                  child: Text(
                    'Misión',
                    style: styleNav,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => switchForm(Pages.vision),
                  child: Text(
                    'Visión',
                    style: styleNav,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () => switchForm(Pages.convocatoria),
                  child: Text(
                    'Convocatorias',
                    style: styleNav,
                  ),
                ),
                TextButton(
                  onPressed: () => switchForm(Pages.login),
                  child: Text(
                    'Inicia Sesión',
                    style: styleNav,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (ctx, constraints) => Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              children: [
                Flexible(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      InicioPage(),
                      MisionPage(),
                      VisionPage(),
                      ConvoPage(),
                      LoginPage()
                    ],
                  ),
                ),
                Divider(),
                Banner()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pages {
  static final int inicio = 0;
  static final int mision = 1;
  static final int vision = 2;
  static final int convocatoria = 3;
  static final int login = 4;
}

class Nav extends StatelessWidget {
  const Nav(
      {this.width,
      this.height,
      this.inicio,
      this.mision,
      this.vision,
      this.convo,
      this.login});

  final double width, height;
  final VoidCallback inicio, mision, vision, convo, login;

  @override
  Widget build(BuildContext context) {
    final styleNav = TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          TextButton(
            onPressed: inicio,
            child: Text(
              'Inicio',
              style: styleNav,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: mision,
            child: Text(
              'Misión',
              style: styleNav,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: vision,
            child: Text(
              'Visión',
              style: styleNav,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: convo,
            child: Text(
              'Convocatorias',
              style: styleNav,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: login,
            child: Text(
              'Inicia Sesión',
              style: styleNav,
            ),
          ),
        ],
      ),
    );
  }
}

class Banner extends StatefulWidget {
  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<Banner> with SingleTickerProviderStateMixin {
  int _currentPage = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
   Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (_currentPage <2) {
          _currentPage++;
        }else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_currentPage);
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        height: MediaQuery.of(context).size.height / 8,
        child: MediaQuery.of(context).size.width < 600
            ? PageView(
                controller: _pageController,
                children: [
                  Column(
                    children: [
                      Text(
                        'Contactenos:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Dirección: Calle 69 No. 2-10',
                        style: TextStyle(),
                      ),
                      Text(
                        'Celular: 3005555555',
                        style: TextStyle(),
                      ),
                      Text(
                        'E.mail: ccc@sena.edu.co',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Nuestros Servicios:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Gestionar Artículos',
                        style: TextStyle(),
                      ),
                      Text(
                        'Gestionar Líneas de Investigación',
                        style: TextStyle(),
                      ),
                      Text(
                        'Gestionar Investigadores',
                        style: TextStyle(),
                      ),
                      Text(
                        'Gestionar Eventos',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Redes Sociales',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.access_alarm_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Contactenos:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Dirección: Calle 69 No. 2-10',
                        style: TextStyle(),
                      ),
                      Text(
                        'Celular: 3005555555',
                        style: TextStyle(),
                      ),
                      Text(
                        'E.mail: ccc@sena.edu.co',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Nuestros Servicios:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Gestionar Artículos',
                        style: TextStyle(),
                      ),
                      Text(
                        'Gestionar Líneas de Investigación',
                        style: TextStyle(),
                      ),
                      Text(
                        'Gestionar Investigadores',
                        style: TextStyle(),
                      ),
                      Text(
                        'Gestionar Eventos',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Redes Sociales',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.access_alarm_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      );
    });
  }
}
