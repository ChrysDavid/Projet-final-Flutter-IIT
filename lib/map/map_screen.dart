import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController _mapController;
  LatLng? _currentLocation;
  List<Marker> _markers = [];
  bool _showCurrentLocation = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    getLocationPermission();
  }

  void getLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        _showCurrentLocation = false;
      });
    }
  }

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _mapController.move(_currentLocation!, 13.0);
      _showCurrentLocation = true;
      _markers.add(
        Marker(
          width: 40.0,
          height: 40.0,
          point: _currentLocation!,
          builder: (ctx) => Container(
            child: Icon(
              Icons.location_on,
              color: Colors.blue,
              size: 40.0,
            ),
          ),
        ),
      );
    });
  }

  void _navigateToCurrentLocation() {
    if (_currentLocation != null) {
      _mapController.move(_currentLocation!, 13.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Map',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement search functionality
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _currentLocation ?? LatLng(13, 15),
          zoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            tileProvider: NetworkTileProvider(),
          ),
          MarkerLayer(
            markers: _markers,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCurrentLocation
            ? _navigateToCurrentLocation
            : () {
                setState(() {
                  getCurrentLocation();
                });
              },
        child: Icon(Icons.my_location),
        backgroundColor: Colors.green,
      ),
    );
  }
}
