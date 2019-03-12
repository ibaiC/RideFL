import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Travel extends StatefulWidget {
  @override
  State<Travel> createState() => TravelState();
}

class TravelState extends State<Travel> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _currentLoc = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(55.872022, -4.285487),
    zoom: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        label: Text('Rent', 
        style: TextStyle(color: Colors.white) ,),
        icon: Icon(Icons.play_arrow, 
        color: Colors.white,),
      ),
    );
  }

  Future<void> _rentBike() async {
    await showDialog<String>(
      context: context,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(20.0),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Please input the Bike Number printed on the bike: ",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.blue)
                ),
              ),)
          ],
        ),
      )
    );
  }
}
