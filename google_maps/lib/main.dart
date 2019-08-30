import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // GoogleMapController mapController;
  final Map<String, Marker> _markers = {}; // 마커

  Future<void> _onMapCreated(GoogleMapController controller) async {
    // mapController = controller;
    final googleOffices = await _getGoogleOffices();

    setState(() {
      _markers.clear();
      // 마커 추가
      googleOffices.offices.forEach((office) => {
        _markers[office.name] = Marker(
            markerId: MarkerId(office.name),
            position: LatLng(office.lat, office.lng),
            infoWindow: InfoWindow(
              title: office.name,
              snippet: office.address,
            ),
        )
      });

    });
  }

  Future<Location> _getGoogleOffices() async {
    const googleLocationsURL = 'https://about.google/static/data/locations.json';

    // Google offices 위치얻기
    final response = await http.get(googleLocationsURL);

    if (response.statusCode == 200) {
      return Location.fromJson(jsonDecode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(googleLocationsURL));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Example'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.532600, 127.024612), // 서울
          zoom: 5.0,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
