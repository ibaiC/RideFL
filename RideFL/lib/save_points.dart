import 'package:flutter/material.dart';

// Generate route with locations on this page

class SavePoints extends StatelessWidget {
  SavePoints({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage("http://www.willgoto.com/images/Size3/UK_Scotland_Glasgow_Kelvingrove_park_University_2b122ec0fde340b6850321158daea541.jpg"),
              ),
              title: Text('Kelvingrove Park'),
              subtitle: Text(
                  'Kelvingrove Park is a public park located on the River Kelvin in the West End of the city of Glasgow,'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('ADD'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: Text('REMOVE'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage("https://ents24.imgix.net/image/000/267/264/dcbb47dc0b2679a9d37ba956bf3e00eb20c18320.jpg?w=358&h=268&auto=format&fit=crop&crop=entropy"),
              ),
              title: Text('Oran Mor'),
              subtitle: Text(
                  'Thriving arts & entertainment site with music, restaurants & an auditorium with a mural ceiling.'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('ADD'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: Text('REMOVE'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
