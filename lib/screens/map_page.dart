import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:passenger_app/service/map_template.dart';
import 'package:passenger_app/service/vertical_dotLine.dart';

class MapPage extends StatefulWidget {
  const MapPage({required Key key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF62AAE5),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            "Track Your Bus",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(1.2878, 103.8666),
              zoom: 11,
              interactionOptions: InteractionOptions(
                flags: InteractiveFlag.doubleTapZoom,
              ),
            ),
            children: [
              openStreetMapTileLayer,
            ],
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: LiveTracking(),
          ),
        ],
      ),
    );
  }
}

class LiveTracking extends StatelessWidget {
  final List<Model> locations = [
    Model("Erode", Colors.green, travelTime: "15 Min"),
    Model("Dubai", Colors.red, travelTime: "20 Min"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Departure Time",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Text(
                "Travel Time: ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "15 Min", 
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ..._buildLocationRows(locations),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BusIcon(travelTime: "14 : 00"),
              BusIcon(travelTime: "14 : 30"),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLocationRows(List<Model> locations) {
    return List.generate(locations.length, (index) {
      return Column(
        children: [
          LocationRow(
            location: locations[index].address,
            color: locations[index].color,
            travelTime: locations[index].travelTime,
            showDotLine: index != locations.length - 1,
          ),
          if (index != locations.length - 1) SizedBox(height: 10),
        ],
      );
    });
  }
}

class LocationRow extends StatelessWidget {
  final String location;
  final Color color;
  final String travelTime;
  final bool showDotLine;

  const LocationRow({
    required this.location,
    required this.color,
    required this.travelTime,
    required this.showDotLine,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(Icons.location_on, color: color),
            if (showDotLine)
              CustomPaint(
                size: Size(1, 40),
                painter: VerticalDottedLinePainter(color: color),
              ),
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location,
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              travelTime,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BusIcon extends StatelessWidget {
  final String travelTime;

  const BusIcon({required this.travelTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.directions_bus, size: 40),
        SizedBox(height: 4),
        Text(
          "Travel Time: $travelTime",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class Model {
  final String address;
  final Color color;
  final String travelTime;

  Model(this.address, this.color, {required this.travelTime});
}
