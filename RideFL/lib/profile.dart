import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.location_city,
                size: 160.0,
                color: Colors.white,
              ),
              new Text(
                "First Tab",
                style: new TextStyle(color: Colors.white),
              )
            ],
          ),
        ),

      ),
    ),
    ];
      //],
  }
}

Widget rowCell(int count, String type) =>
    new Expanded(child: new Column(children: <Widget>[
      new Text('$count', style: new TextStyle(color: Colors.white),),
      new Text(type, style: new TextStyle(
          color: Colors.white, fontWeight: FontWeight.normal))
    ],));
