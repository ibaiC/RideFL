import 'package:flutter/material.dart';
import 'package:login/explore.dart';
import 'package:login/save_points.dart';
import 'package:login/profile.dart';
import 'package:login/travel.dart';



class ActiveMap extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _ActiveMapState createState() =>  _ActiveMapState();
}

class _ActiveMapState extends State<ActiveMap> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller =  TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // Appbar
      appBar:  AppBar(
        title:  Text("RIDE",
        style:TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body:  TabBarView(
        physics:  NeverScrollableScrollPhysics(),
        // Add tabs as widgets
        children: <Widget>[Travel(), Explore(), SavePoints(), Profile()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar:  Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child:  TabBar(
          tabs: <Tab>[
             Tab(
              // set icon to the tab
              icon:  Icon(Icons.directions_bike,
              color: Colors.white),
            ),
             Tab(
              icon:  Icon(Icons.explore,
              color: Colors.white),
            ),
             Tab(
              icon:  Icon(Icons.location_city,
              color: Colors.white),
            ),
             Tab(
              // set icon to the tab
              icon:  Icon(Icons.person,
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
