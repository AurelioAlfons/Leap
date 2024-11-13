import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final LatLng _location =
      const LatLng(-37.79371684309027, 144.89852896518929); // Fixed coordinates
  final double _initialZoom = 30.0; //

  @override
  void initState() {
    super.initState();
    _zoomInOnLoad();
  }

  Future<void> _zoomInOnLoad() async {
    // Delay to allow map to load first, then zoom in gradually
    await Future.delayed(const Duration(milliseconds: 500));
    _mapController.move(_location, 50.0); // Zoom level 12.0 after delay
    await Future.delayed(const Duration(milliseconds: 500));
    _mapController.move(_location, 17.5); // Final zoom level 15.0 after delay
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.brightness_4
                  : Icons.brightness_4_outlined,
              color: themeProvider.isDarkMode
                  ? DarkMode.iconColor
                  : LightMode.iconColor,
            ),
            onPressed: themeProvider.toggleTheme,
            tooltip: 'Toggle Theme',
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _location,
          initialZoom: _initialZoom, // Start with a lower initial zoom level
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _location,
                width: 80.0,
                height: 80.0,
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
