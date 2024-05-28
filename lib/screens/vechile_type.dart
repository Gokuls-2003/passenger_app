import 'package:flutter/material.dart';

class Vechile_Type extends StatefulWidget {
  final String selectedVehicle;

  const Vechile_Type({super.key, required this.selectedVehicle});

  @override
  State<Vechile_Type> createState() => _Vechile_TypeState();
}

class _Vechile_TypeState extends State<Vechile_Type> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Type: ${widget.selectedVehicle}"),
      ),
      body: Center(
        child: Text(
          "Selected Vehicle: ${widget.selectedVehicle}",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
