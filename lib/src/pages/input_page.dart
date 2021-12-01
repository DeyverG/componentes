import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";
  String _opcionSeleccionada = "- Selecciona -";
  bool _passwordView = true;
  final List _profesiones = [
    "- Selecciona -",
    "Ingeniero",
    "Medico",
    "Profesor",
    "Quimico"
  ];
  final TextEditingController _inputFieldDateController =
      TextEditingController();
  List<DropdownMenuItem<String>> items() {
    List<DropdownMenuItem<String>> lista = [];

    for (var profesion in _profesiones) {
      lista.add(DropdownMenuItem(
        child: Text(profesion),
        value: profesion,
      ));
    }

    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inputs"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _inputUno(),
          const Divider(),
          _inputEmail(),
          const Divider(),
          _inputPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDropDown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _inputUno() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Nombre',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle),
          labelText: 'Nombre',
          helperText: 'Nombre de la persona',
          counter: Text("Letras ${_nombre.length}")),
      autofocus: false,
      onChanged: (valor) {
        _nombre = valor;
        setState(() {});
      },
    );
  }

  Widget _inputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Email',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle),
          labelText: 'Email'),
      autofocus: false,
      onChanged: (valor) {
        _email = valor;
        setState(() {});
      },
    );
  }

  Widget _inputPassword() {
    return TextField(
      obscureText: _passwordView,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Password',
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(50),
            child: _passwordView
                ? const Icon(Icons.lock)
                : const Icon(Icons.lock_open),
            onTap: () => cambiar(),
          ),
          icon: const Icon(Icons.lock),
          labelText: 'Password'),
      autofocus: false,
      onChanged: (valor) {
        _password = valor;
        setState(() {});
      },
    );
  }

  void cambiar() {
    _passwordView = !_passwordView;
    setState(() {});
  }

  Widget _crearFecha(context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: const Icon(Icons.perm_contact_cal_rounded),
        icon: const Icon(Icons.calendar_today),
      ),
      autofocus: false,
      onTap: () {
        // Para quitar el focus en el input de fecha
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
        locale: const Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha.split(" ")[0];
      });
    }
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(width: 18),
        Flexible(
          child: Container(
            height: 55,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: DropdownButton(
              isExpanded: true,
              underline: const Text(""),
              borderRadius: BorderRadius.circular(10),
              value: _opcionSeleccionada,
              items: items(),
              onChanged: (opt) {
                _opcionSeleccionada = opt.toString();
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email"),
      trailing: Text("Profesion: $_opcionSeleccionada"),
    );
  }
}
