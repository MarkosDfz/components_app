
import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width  = 50.0;
  double _height = 50.0;

  Color _color   = Colors.pink;
  BorderRadiusGeometry _border = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _border
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiar
      ),
    );
  }

  void _cambiar() {

    final ramdom = Random();

    setState(() {
      _height = ramdom.nextInt(300).toDouble();
      _width  = ramdom.nextInt(300).toDouble();
      _color  = Color.fromRGBO(
        ramdom.nextInt(255),
        ramdom.nextInt(255),
        ramdom.nextInt(255),
        1
      );
      _border = BorderRadius.circular(ramdom.nextInt(100).toDouble());
    });
  }

}