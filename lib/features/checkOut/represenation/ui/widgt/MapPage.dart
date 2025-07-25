import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng _selectedLocation = LatLng(32.2211, 35.2544); // موقع افتراضي (نابلس)
  final MapController _mapController = MapController();
  String _selectedAddress = "اضغط على الخريطة لاختيار موقعك";

  // عند الضغط على الخريطة
  void _onTap(TapPosition tapPosition, LatLng point) async {
    setState(() {
      _selectedLocation = point;
      _selectedAddress = "جارٍ جلب العنوان...";
    });

    // جلب العنوان النصي باستخدام Nominatim API
    final address = await _getAddressFromLatLng(point.latitude, point.longitude);
    setState(() {
      _selectedAddress = address;
    });

    print("Selected Location: ${point.latitude}, ${point.longitude}");
  }

  // دالة لتحويل الإحداثيات إلى عنوان نصي (Reverse Geocoding)
  Future<String> _getAddressFromLatLng(double lat, double lng) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng&zoom=18&addressdetails=1');

    try {
      final response = await http.get(url, headers: {
        'User-Agent': 'YourAppName/1.0 (contact@example.com)'
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['display_name'] ?? "Address not found";
      } else {
        return "Failed to get address (Code: ${response.statusCode})";
      }
    } catch (e) {
      return "Error fetching address: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location (OSM)"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _selectedLocation,
              initialZoom: 13,
              onTap: (tapPosition, point) => _onTap(tapPosition, point),
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                tileProvider: NetworkTileProvider(
                  headers: {
                    'User-Agent': 'YourAppName/1.0 (contact@example.com)',
                  },
                ),
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 40,
                    height: 40,
                    point: _selectedLocation,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Text(
                _selectedAddress,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
                onPressed: () async {
                  final address = await _getAddressFromLatLng(
                    _selectedLocation.latitude,
                    _selectedLocation.longitude,
                  );
                  Navigator.pop(context, address); // يرجع النص بدل LatLng
                },

                icon: const Icon(Icons.check, color: Colors.white),
              label: const Text(
                "Confirm Location",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
