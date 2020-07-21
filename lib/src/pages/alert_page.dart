
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          child: Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlert(context) 
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_left),
        onPressed: () {
          Navigator.pop(context);
        }
        ),
    );
  }

  void _mostrarAlert(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la alerta'),
              FlutterLogo( size: 100.0, )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop()
            ),
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () => Navigator.of(context).pop()
            )
          ],
        );
      }
    );

  }

}