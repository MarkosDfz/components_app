
import 'package:flutter/material.dart';

class ImputPage extends StatefulWidget {
  @override
  _ImputPageState createState() => _ImputPageState();
}

class _ImputPageState extends State<ImputPage> {

  String _nombre = '';
  String _mail   = '';
  String _fecha  = '';
  bool _isVisiblePass = false;
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Fuerza'];
  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearImput(),
          Divider(),
          _crearMail(),
          Divider(),
          _crearPass(),
          Divider(),
          _crearFecha(context),
          _crearDropdown(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearImput() {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        helperText: 'Nombre',
        labelText: 'Nombre Completo',
        icon: Icon(Icons.account_circle),
        hintText: 'Aqui va el nombre :V',
        suffixIcon: Icon(Icons.insert_comment),
        counter: Text('Letras ${_nombre.length}'),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );

  }

  Widget _crearMail() {

    return TextField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: 'Email',
        icon: Icon(Icons.mail),
        hintText: 'Aqui va el mail :V',
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (valor) {
        setState(() {
          _mail = valor;
        });
      },
    );
  }

  Widget _crearPass() {

    return TextField(
      autofocus: false,
      obscureText: !_isVisiblePass,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: 'Password',
        icon: Icon(Icons.security),
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: !_isVisiblePass ? Icon(Icons.remove_red_eye) : Icon(Icons.close),
          onPressed: () {
            setState(() {
              _isVisiblePass = !_isVisiblePass;
            });
          }
        ),
      ),
      onChanged: (valor) {
        setState(() {
          _mail = valor;
        });
      },
    );

  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: 'Fecha',
        icon: Icon(Icons.calendar_today),
        hintText: 'Fecha',
        suffixIcon: Icon(Icons.date_range),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2022),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDate.text = _fecha;
      });
    }
  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.blur_circular),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          }
        ),
      ],
    );

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  } 

  Widget _crearPersona() {

    return ListTile(
      title: Text('El nombre es $_nombre'),
      subtitle: Text('El mail es $_mail'),
      trailing: Text(_opcionSeleccionada),
    );
    
  }

}