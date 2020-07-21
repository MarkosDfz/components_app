
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              radius: 23.0,
              backgroundImage: NetworkImage('https://image.winudf.com/v2/image/Y29tLmFuZHJvbW8uZGV2MzM3NzM1LmFwcDcyOTEzOV9zY3JlZW5fMl8xNTE1OTk1NDExXzAwMA/screen-2.jpg?fakeurl=1&type=.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('GV', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),

      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/load.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          image: NetworkImage('https://a-static.besthdwallpaper.com/hellsing-alucard-papel-pintado-2400x1350-12302_50.jpg')
        ),
      )
    );

  }
}