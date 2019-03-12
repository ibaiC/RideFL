import 'package:flutter/material.dart';
import 'package:login/map_page.dart';


class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome explorer!',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Tap "Start" to start exploring the city. Enjoy your ride!',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final start = Container(
      margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        color: Colors.lightBlueAccent,
        child: Text("Start Exploring",
        style: TextStyle(fontSize: 16.0, color: Colors.white),),
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage()),
          );
        },
      ),);

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(80.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem, start],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
