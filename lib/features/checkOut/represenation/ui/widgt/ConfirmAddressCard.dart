import 'dart:convert';
import 'package:flutter/material.dart';
import 'MapPage.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class ConfirmAddressCard extends StatelessWidget {
  final Function(String)? onLocationPicked;

  const ConfirmAddressCard({super.key, this.onLocationPicked});

  // دالة لتحويل الإحداثيات إلى عنوان نصي باستخدام Nominatim API
  Future<String> _getAddressFromLatLng(LatLng location) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=${location.latitude}&lon=${location.longitude}&zoom=18&addressdetails=1',
    );

    try {
      final response = await http.get(url, headers: {"User-Agent": "FlutterApp"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['display_name'] ?? "Address not found";
      } else {
        return "Failed to fetch address";
      }
    } catch (e) {
      return "Error fetching address: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final String? address = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapPage()),
          );

          if (address != null) {
            onLocationPicked?.call(address);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Location"),
                content: Text(address),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          }
        },

        child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Confirm your Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "Open the map and choose where you want us to deliver your order to",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: const Center(
                child: Icon(Icons.location_on, color: Colors.pink, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
