import 'package:flutter/material.dart';
import 'placeholder_widget.dart';

class MapPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List<Widget> _children = [
   PlaceholderWidget(Colors.lightGreenAccent),
   PlaceholderWidget(Colors.deepOrange),
   PlaceholderWidget(Colors.green),
   PlaceholderWidget(Colors.purple)
 ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("RIDE",
        style: TextStyle(fontSize: 28.0, color: Colors.white),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        fixedColor: Colors.orange,
        currentIndex: 0, // Will be set on tab tap
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike, color: Color.fromARGB(255, 0, 0, 0)),
            title: Text("Travel")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: Color.fromARGB(255, 0, 0, 0)),
            title: Text("Explore")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city, color: Color.fromARGB(255, 0, 0, 0)),
            title:Text("Save")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0)),
            title:Text("Profile")
          ),
        ]
      ),
      
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

}
