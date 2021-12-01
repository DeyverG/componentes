import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/silder_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';

Map<String, WidgetBuilder> obtenerRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    '/alert': (BuildContext context) => const AlertPage(),
    '/avatar': (BuildContext context) => const AvatarPage(),
    '/card': (BuildContext context) => const CardPage(),
    '/animated': (BuildContext context) => const AnimatedContainerPage(),
    '/inputs': (BuildContext context) => InputPage(),
    '/sliders': (BuildContext context) => SliderPage(),
    '/list': (BuildContext context) => ListaPage(),
  };
}
