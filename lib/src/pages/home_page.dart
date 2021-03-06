
import 'package:flutter/material.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/provider/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {
        
        return ListView(
          children: _listaItems( snapshot.data, context ),
        );
      } ,
    );

  }

  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = [];

    // if (data == null) {
    //   data = [];
    // }

    data.forEach( (opt) {

      final temp = new ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(temp)
              ..add( Divider() );

    });

    return opciones;
    
  }
  
}