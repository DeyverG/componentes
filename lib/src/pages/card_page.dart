import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        children: [
          _cardUno(),
          const SizedBox(
            height: 30,
          ),
          _cardDos(context),
          const SizedBox(
            height: 30,
          ),
          _cardUno(),
          const SizedBox(
            height: 30,
          ),
          _cardDos(context),
          const SizedBox(
            height: 30,
          ),
          _cardUno(),
          const SizedBox(
            height: 30,
          ),
          _cardDos(context),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _cardUno() {
    return Card(
      elevation: 10,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(children: [
        const ListTile(
          leading: Icon(
            Icons.image,
            color: Colors.blue,
          ),
          title: Text("Card Numero 1"),
          subtitle: Text(
              "Si la vida fuera estable todo el tiempo, yo no beberia ni malgastaria la plata"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: const Text("Cancelar")),
            TextButton(onPressed: () {}, child: const Text("OK"))
          ],
        )
      ]),
    );
  }

  Widget _cardDos(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(10, 10))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            FadeInImage(
                height: 90 * MediaQuery.of(context).devicePixelRatio,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 200),
                placeholder: const AssetImage("assets/jar-loading.gif"),
                image: const NetworkImage(
                    "https://photographylife.com/wp-content/uploads/2020/03/Dan-Ballard-Landscapes-6.jpg")),
            Container(
              child: const Text("No tengo idea de que poner"),
              padding: const EdgeInsets.all(10),
            )
          ],
        ),
      ),
    );
  }
}
