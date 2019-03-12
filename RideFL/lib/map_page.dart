import 'package:flutter/material.dart';
import 'package:login/travel.dart';
import 'package:login/explore.dart';
import 'package:login/save_points.dart';
import 'package:login/profile.dart';


class MapPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        title: new Text("RIDE",
        style:TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        physics: new NeverScrollableScrollPhysics(),
        // Add tabs as widgets
        children: <Widget>[new Travel(), new Explore(), new SavePoints(), new Profile()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.directions_bike,
              color: Colors.white),
            ),
            new Tab(
              icon: new Icon(Icons.explore,
              color: Colors.white),
            ),
            new Tab(
              icon: new Icon(Icons.location_city,
              color: Colors.white),
            ),
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.person,
              color: Colors.white),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
