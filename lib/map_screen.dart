import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; 
import 'package:geolocator/geolocator.dart'; 
import 'package:google_fonts/google_fonts.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Default coordinates fallback (Indore)
  LatLng _currentPos = const LatLng(22.7196, 75.8577); 
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _loading = false);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _loading = false);
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPos = LatLng(position.latitude, position.longitude);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City Hazard Map", 
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: const Color(0xFF1A237E))),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1A237E)),
      ),
      body: Column(
        children: [
          Expanded( 
            child: _loading 
              ? const Center(child: CircularProgressIndicator(color: Color(0xFF1A237E))) 
              : FlutterMap(
                  options: MapOptions(
                    initialCenter: _currentPos,
                    initialZoom: 15.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.civic_lens',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _currentPos,
                          width: 60, height: 60,
                          child: const Icon(Icons.my_location, color: Colors.blue, size: 30),
                        ),
                      ],
                    ),
                  ],
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _determinePosition,
        backgroundColor: const Color(0xFF1A237E),
        child: const Icon(Icons.gps_fixed, color: Colors.white),
      ),
    );
  }
}