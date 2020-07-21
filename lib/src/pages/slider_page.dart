
import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _valorCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders')
      ),
      body: Container(
        padding: EdgeInsets.only(top: 70.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheck(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      min: 10.0,
      max: 400.0,
      label: 'Tamaño',
      activeColor: Colors.indigoAccent,
      value: _valorSlider,
      onChanged: (_valorCheck) ? null :  (valor) {
        setState(() {
          _valorSlider = valor;
        });
      }
    );
  }

  Widget _crearCheck() {

    // return Checkbox(
    //   value: _valorCheck,
    //   onChanged: (valor) {
    //     setState(() {
    //       _valorCheck = valor;
    //     });
    //   }
    // );

    return CheckboxListTile(
      title: Text('Bloquear check'),
      value: _valorCheck,
      onChanged: (valor) {
        setState(() {
          _valorCheck = valor;
        });
      }
    );

  }

  Widget _crearSwitch() {

    return SwitchListTile(
      title: Text('Bloquear check'),
      value: _valorCheck,
      onChanged: (valor) {
        setState(() {
          _valorCheck = valor;
        });
      }
    );

  }

  Widget _crearImagen() {

    return Image(
      height: _valorSlider,
      width: _valorSlider,
      fit: BoxFit.contain,
      image: NetworkImage('https://pngriver.com/wp-content/uploads/2018/03/Download-Bowser-PNG-Clipart-For-Designing-Purpose-1000x982.png')
    );
  }
}