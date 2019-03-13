import 'package:flutter/material.dart';
import 'package:login/travel.dart';

class Profile extends StatelessWidget {
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
        'Tom Notcruise',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: Text(
            'You have burnt 3497 calories with RIDE!',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ));

    final start = Container(
      margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        color: Colors.lightBlueAccent,
        child: Text(
          "Start Exploring",
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Travel()),
          );
        },
      ),
    );

    final email = Container(
      margin: EdgeInsets.fromLTRB(25.0, 00.0, 0.0, 0.0),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Email address",
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white)
        ),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue[200],
          Colors.greenAccent,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem, email, start],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
