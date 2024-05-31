import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Curved_Bottom extends StatefulWidget {
  final int currentIndex; // Add this line

  const Curved_Bottom({Key? key, required this.currentIndex})
      : super(key: key); // Modify this line

  @override
  State<Curved_Bottom> createState() => _Curved_BottomState();
}

class _Curved_BottomState extends State<Curved_Bottom> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      buttonBackgroundColor: Color(0xFF62AAE5),
      color: Color(0xFF62AAE5),
      animationDuration: const Duration(milliseconds: 100),
      index: widget.currentIndex, // Add this line
      items: <Widget>[
        Icon(
          Icons.home,
          size: 26,
          color: Colors.white,
        ),
        Icon(
          Icons.message,
          size: 26,
          color: Colors.white,
        ),
        Icon(
          Icons.search,
          size: 26,
          color: Colors.white,
        ),
        Icon(
          Icons.bus_alert,
          size: 26,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          size: 26,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        setState(() {
          // No need to set _page here
        });
        if (index == 2) {
          Navigator.pushNamed(context, '/search');
        }
        if (index == 0) {
          Navigator.pushNamed(context, '/home');
        }if (index == 4) {
          Navigator.pushNamed(context, '/person');
        }
      },
    );
  }
}
