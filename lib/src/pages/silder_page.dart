import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double valorSlider = 100.0;
  bool bloquearSlider = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Slider"),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _crearSlider(),
              _crearCheckBox(),
              _crearCheckListTile(),
              _crearSwitch(),
              Expanded(child: _crearImagen())
            ],
          ),
        ));
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: "Tamaño de la imagen",
        value: valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: bloquearSlider
            ? null
            : (double newValor) {
                setState(() {
                  valorSlider = newValor;
                });
              });
  }

  Widget _crearCheckBox() {
    return Checkbox(
        value: bloquearSlider,
        onChanged: (check) {
          setState(() {
            bloquearSlider = !bloquearSlider;
          });
        });
  }

  Widget _crearCheckListTile() {
    return CheckboxListTile(
        title: const Text("Bloquear Slider"),
        value: bloquearSlider,
        onChanged: (check) {
          setState(() {
            bloquearSlider = !bloquearSlider;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: const Text("Bloquear Slider"),
        value: bloquearSlider,
        onChanged: (check) {
          setState(() {
            bloquearSlider = !bloquearSlider;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
      image:
          const NetworkImage("https://pngimg.com/uploads/fox/fox_PNG23161.png"),
      width: valorSlider,
      fit: BoxFit.contain,
    );
  }
}
