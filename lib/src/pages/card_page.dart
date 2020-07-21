
import 'package:flutter/material.dart';

class CardPAge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.all_inclusive, color: Colors.blue,),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text('qui tirando parada prro :V tienes que poder controlar fultter'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {}
              ),
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () {}
              )
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo2() {

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://www.josesaenzstudio.com/wp-content/uploads/2018/02/landscape3.jpg'),
            placeholder: AssetImage('assets/load.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Aqui va algo :v')
          ),
        ],
      ),
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(30.0),
    //     color: Colors.white,
    //     boxShadow: <BoxShadow>[
    //       BoxShadow(
    //         color: Colors.black26,
    //         blurRadius: 10.0,
    //         spreadRadius: 2.0,
    //       )
    //     ],
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(30.0),
    //     child: card,
    //   ),
    // );

  }

}