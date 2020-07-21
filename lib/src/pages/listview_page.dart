
import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregr10();
    
    _scrollController.addListener((){

      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _agregr10();
        fetchData();
      }
    });
  }
  
  @override
    void dispose() {
      super.dispose();
      _scrollController.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas')
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          
          final imagen = _listaNumeros[index];
          
          return FadeInImage(
            placeholder: AssetImage('assets/load.gif'),
            image: NetworkImage('https://picsum.photos/500/375/?images=$imagen')
          );
        }
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    
    final duration = new Duration(seconds: 2);

    new Timer( duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregr10();
    }); 

    return Future.delayed(duration);
  }

  void _agregr10() {

    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});

  }
  
  Future<Null> fetchData() async {

    _isLoading = true;

    setState(() {});

    final duration = new Duration( seconds: 3 );

    new Timer(duration, requestHttp);
  }

  void requestHttp() {

    _isLoading = false;

    _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
      );

    _agregr10();

  }

  Widget _crearLoading() {

    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox( height: 15.0,)
        ],
      );
    } else {
      return Container();
    }
  }
}