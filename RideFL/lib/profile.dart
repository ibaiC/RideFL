import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery
        .of(context)
        .size
        .width;
    final _height = MediaQuery
        .of(context)
        .size
        .height;
    final String imgUrl = 'assets/alucard.jpg';

      return new Stack(children: <Widget>[
        new Container(color: Colors.blue,),
        new Image.network(imgUrl, fit: BoxFit.fill,),
        new BackdropFilter(
        filter: new ui.ImageFilter.blur(
        sigmaX: 6.0,
        sigmaY: 6.0,
        ),
        child: new Container(
        decoration: BoxDecoration(
        color:  Colors.blue.withOpacity(0.9),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),)),
        return new Scaffold(
          backgroundColor: Colors.red,
          body: new Container(


            child: new Center(
              children: <Widget>[
                new SizedBox(height: _height / 12,),
                new CircleAvatar(
                  radius: _width < _height ? _width / 4 : _height / 4,
                  backgroundImage: NetworkImage(imgUrl),),
                new SizedBox(height: _height / 25.0,),
                new Text('Eric Schmidt', style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width / 15,
                    color: Colors.white),),
                new Padding(padding: new EdgeInsets.only(
                    top: _height / 30, left: _width / 8, right: _width / 8),
                  child: new Text(
                    'Snowboarder, Superhero and  writer.\nSometime I work at google as Executive Chairman ',
                    style: new TextStyle(fontWeight: FontWeight.normal,
                        fontSize: _width / 25,
                        color: Colors.white), textAlign: TextAlign.center,),),
                new Divider(height: _height / 30, color: Colors.white,),
                new Row(
                  children: <Widget>[
                    rowCell(343, 'POSTS'),
                    rowCell(673826, 'FOLLOWERS'),
                    rowCell(275, 'FOLLOWING'),
                  ],),
                new Divider(height: _height / 30, color: Colors.white),
                new Padding(
                  padding: new EdgeInsets.only(left: _width / 8, right: _width / 8),
                  child: new FlatButton(onPressed: () {},
                    child: new Container(child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.person),
                        new SizedBox(width: _width / 30,),
                        new Text('FOLLOW')
                      ],)), color: Colors.blue[50],),),
    //          child: new Column(
    //            // center the children
    //            mainAxisAlignment: MainAxisAlignment.center,
    //            children: <Widget>[
    //              new Icon(
    //                Icons.person,
    //                size: 160.0,
    //                color: Colors.white,
    //              ),
    //              new Text(
    //                "First Tab",
    //                style: new TextStyle(color: Colors.white),
    //              )
              ],
    ],
//          ),
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