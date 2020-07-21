
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'), 
        ),
        body: ListView(
          // children: _crearItems(),
          children: _crearItemsCorta(),
        ),
      ),
    );
  }

  // List<Widget> _crearItems() {

  //   List<Widget> lista = new List<Widget>();

  //   for (String opt in opciones) {

  //     lista..add(Text(opt))
  //          ..add(Divider());
  //   }

  //   return lista;

  // }


  List<Widget> _crearItemsCorta() {

    return opciones.map( (item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('data'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();

  }


}