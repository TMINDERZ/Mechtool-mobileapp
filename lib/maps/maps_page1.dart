import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage1 extends StatefulWidget {
  const MapsPage1({super.key});
  static const String id = 'map_screen_1';

  @override
  State<MapsPage1> createState() => _MapsPage1State();
}

class _MapsPage1State extends State<MapsPage1> {
  late GoogleMapController controller;
  late Future<BitmapDescriptor?> _customMarkerFuture;
  late String lat;
  late String long;
  late LatLng userLocation = const LatLng(0, 0);
  @override
  void initState() {
    super.initState();
    _customMarkerFuture = setCustomMaker();
    _getCurrentLocation().then((value) {
      lat = '${value.latitude}';
      long = '${value.longitude}';
      setState(() {
        userLocation = LatLng(value.latitude, value.longitude);
      });
      _liveLocation();
    });
  }

  Future<BitmapDescriptor?> setCustomMaker() async {
    return await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/store1.png');
  }

  //Getting Current Location
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanently denied, we cannot request location again');
    }
    return await Geolocator.getCurrentPosition();
  }

  //getting users location updates
  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        userLocation = LatLng(position.latitude, position.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BitmapDescriptor?>(
        future: _customMarkerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading marker'));
          }
          final BitmapDescriptor? bitmapDescriptor = snapshot.data;
          if (bitmapDescriptor == null) {
            return const Center(child: Text('Error loading marker'));
          }
          return GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(6.90467387471033, 79.9663670506234),
              zoom: 13,
            ),
            polylines: {
              Polyline(
                  polylineId: const PolylineId("1"),
                  width: 5,
                  color: Colors.red,
                  patterns: const [
                    PatternItem.dot,
                  ],
                  points: [
                    userLocation,
                    const LatLng(6.90467387471033, 79.9663670506234),
                  ]),
            },
            markers: {
              Marker(
                markerId: const MarkerId('2'),
                position: userLocation,
                infoWindow: const InfoWindow(title: 'Your Location'),
                icon: BitmapDescriptor.defaultMarker,
              ),
              Marker(
                markerId: const MarkerId('3'),
                position: const LatLng(6.90467387471033, 79.9663670506234),
                infoWindow: const InfoWindow(title: 'C.B.C Hardware'),
                icon: bitmapDescriptor,
              ),
            },
          );
        },
      ),
    );
  }
}
//cinec loc position: LatLng(6.91563, 79.96096),
