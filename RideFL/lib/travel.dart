import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login/route_config.dart';

class Travel extends StatefulWidget {
  @override
  State<Travel> createState() => TravelState();
}

typedef Marker MarkerUpdateAction(Marker marker);

class TravelState extends State<Travel> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 1;
  PolylineId selectedPolyline;

  LatLng _createLatLng(double lat, double lng) {
    return LatLng(lat, lng);
  }

// Add points to make it look like a route
  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(_createLatLng(55.865780, -4.267183));
    points.add(_createLatLng(55.872315, -4.289218));
    points.add(_createLatLng(55.869255, -4.287296));
    return points;
  }

  void _addPolyline() {
    final int polylineCount = polylines.length;

    if (polylineCount == 12) {
      return;
    }

    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.indigo[900],
      width: 5,
      points: _createPoints(),
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  void _add(id, lat, long, place, locationType) {
    var markerIdVal = id;
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        lat,
        long,
      ),
      infoWindow: InfoWindow(title: place, snippet: locationType),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

  static final CameraPosition _currentLoc = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(55.869309,-4.278599),
    zoom: 14.0,
  );

  //   void _add(id, lat, long, place, locationType) {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _currentLoc,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _add("100", 55.865780, -4.267183, "Mango", "Bar");
          _add("200", 55.872315, -4.289218, "University of Glasgow",
              "University");
          _add("300", 55.869255, -4.287296, "Kelvingrove Park", "Park");
          _addPolyline();
        },
        markers: Set<Marker>.of(markers.values),
        polylines: Set<Polyline>.of(polylines.values),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _rentBike,
        label: Text('End Trip', style: TextStyle(color: Colors.white)),
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
                },
              )
            ],
          );
        });
  }
}
