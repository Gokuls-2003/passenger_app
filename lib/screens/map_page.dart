import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Map_page extends StatefulWidget {
  const Map_page({super.key});

  @override
  State<Map_page> createState() => _Map_pageState();
}

class _Map_pageState extends State<Map_page> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        center: LatLng(1.2878, 103.8666),
        zoom: 11,
        interactionOptions: InteractionOptions(
          flags: InteractiveFlag.doubleTapZoom,
        ),
      ),
      children: [
        openStreetMapTileLayer,
      ],
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
