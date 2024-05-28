import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Gotoz",
            style: TextStyle(fontSize: 22),
          ),
        ),
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add your onPressed logic here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Content(),
      bottomNavigationBar: _Curved_Bottom_Navigatiom(),
    );
  }

  Widget Content() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: Column(
        children: [
          TextFormField(
              decoration: InputDecoration(
                  hintText: "From", icon: Icon(Icons.bus_alert)))
        ],
      ),
    );
  }

  Widget _Curved_Bottom_Navigatiom() {
    return CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.yellow,
        color: Colors.yellow,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
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
          )
        ]);
  }
}
