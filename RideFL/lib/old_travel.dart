import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login/route_config.dart';


class HomeTravel extends StatefulWidget {
  @override
  State<HomeTravel> createState() => HomeTravelState();
}

class HomeTravelState extends State<HomeTravel> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _currentLoc = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(55.872022, -4.285487),
    zoom: 15.0,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _currentLoc,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _rentBike,
        label: Text('Rent', style: TextStyle(color: Colors.white)),
        icon: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> _rentBike() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Please enter the bike numer",
              style: TextStyle(color: Colors.blue),
            ),
            contentPadding: EdgeInsets.all(20.0),
            content: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    autofocus: true,
                  ),
                )
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text("Ok"),
                onPressed: () {
                  // Go to route config
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteConfig()),
                  );
                },)
            ],
          );
        });
  }
}
