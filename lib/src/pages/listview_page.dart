import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> listaNumeros = [];
  int ultimoNumero = 0;
  bool isLoading = false;

  //crearemos un controlador para el scroll para saber cuando llega a la ultima posicion y
  // cargar 10 imagenes mas
  ScrollController scrollController = ScrollController();

  //esta funcion se ejecuta al iniciar lo cual permite llenar el array y no dejarlo como null
  //lo cual hace que no produzca error
  @override
  void initState() {
    super.initState();
    _agregar10();

    //agregaremos el evento para que cuando llegue al final cargue 10 imagenes mas
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  // se elimina todo cuando la vista se destruye para evitar fuga de memoria
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listas"),
        ),
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    //Un RefreshIndicator se usa en listas con Scroll para poder hacer el refresh
    return RefreshIndicator(
      onRefresh: refrescarLista,
      child: ListView.builder(
          controller: scrollController,
          itemCount: listaNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = listaNumeros[index];

            return FadeInImage(
                fit: BoxFit.cover,
                height: 300,
                placeholder: const AssetImage("assets/jar-loading.gif"),
                image:
                    NetworkImage("https://picsum.photos/id/$imagen/500/300"));
          }),
    );
  }

  Future refrescarLista() async {
    Duration duration = const Duration(seconds: 2);

    Timer(duration, restablecerData);

    //Se agrega este delay porque la funcion Future termina pero el
    //restablecerData se ejecuta 2 segundos despues entonces la idea es
    //frenar el future 2 segundos
    return Future.delayed(duration);
  }

  restablecerData() {
    listaNumeros.clear();
    ultimoNumero++;
    _agregar10();
  }

  //Funcion que agrega 10 posiciones mas al array
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      ultimoNumero++;
      listaNumeros.add(ultimoNumero);
    }
    setState(() {});
  }

  //Funcion que simula un tiempo de carga de una peticion
  Future fetchData() async {
    isLoading = true;
    const duration = Duration(seconds: 2);

    //Timer funciona como el setTimeOut
    //despues de cierto tiempo ejecuta la funcion
    Timer(duration, requestHTTP);

    setState(() {});
  }

  void requestHTTP() {
    isLoading = false;

    scrollController.animateTo(scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  //Widget de Loading mientras carga la peticion
  Widget _crearLoading() {
    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
