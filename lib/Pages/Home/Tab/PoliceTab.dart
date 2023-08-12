import 'package:flutter/material.dart';
import 'package:location/location.dart' as LocationPackage;
import 'package:geocoding/geocoding.dart';

class PoliceTab extends StatefulWidget {
  @override
  _PoliceTabState createState() => _PoliceTabState();
}

class _PoliceTabState extends State<PoliceTab> {
  LocationPackage.LocationData? _currentLocation;
  String _currentAreaName = "Loading...";

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    LocationPackage.Location location = LocationPackage.Location();
    bool _serviceEnabled;
    LocationPackage.PermissionStatus _permissionGranted;
    LocationPackage.LocationData _locationData;

    try {
      // Check if location services are enabled
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          // Location services are still not enabled, handle accordingly
          return;
        }
      }

      // Check if location permissions are granted
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == LocationPackage.PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != LocationPackage.PermissionStatus.granted) {
          // Location permissions are not granted, handle accordingly
          return;
        }
      }

      // Get the user's current location
      _locationData = await location.getLocation();
      setState(() {
        _currentLocation = _locationData;
      });

      // Get the area name based on the current latitude and longitude
      if (_currentLocation != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentLocation!.latitude!,
          _currentLocation!.longitude!,
          localeIdentifier: "en",
        );
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          String areaName = placemark.name ?? "Unknown";
          setState(() {
            _currentAreaName = areaName;
          });
        }
      }
    } catch (e) {
      // Handle exceptions here, if any
      print("Error while getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // ...

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_currentLocation != null)
            Text(
              "Current Location: ${_currentLocation!.latitude}, ${_currentLocation!.longitude}",
            ),
          Text("Area Name: $_currentAreaName"), // Display the area name
          // Build your custom minimap here using Flutter's widgets
          // You can use the "flutter_map" package or similar to create the minimap.
        ],
      ),
    );
  }
}
