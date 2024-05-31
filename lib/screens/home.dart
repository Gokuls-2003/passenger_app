import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:passenger_app/screens/map_page.dart';
import 'package:passenger_app/screens/travell_history.dart';
import 'package:passenger_app/service/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0; // 0 for Home, 1 for Search

  final List<TravelHistory> travelHistory = [
    TravelHistory(from: "Erode", to: "Dubai", travelTime: "30 Min"),
    TravelHistory(from: "Chennai", to: "Bangalore", travelTime: "6 Hours"),
    // Add more travel history entries here
  ];

  @override
  void initState() {
    super.initState();
    currentPage = 0; // Set the current page to Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF62AAE5),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Gotoz",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xFF62AAE5),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          content(),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Recent Search",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: travelHistory.length,
                        itemBuilder: (context, index) {
                          final history = travelHistory[index];
                          return ListTile(
                            leading:
                                Icon(Icons.bus_alert, color: Colors.yellow),
                            title: Text("${history.from} to ${history.to}"),
                            subtitle:
                                Text("Travel Time: ${history.travelTime}"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Curved_Bottom(currentIndex: 0),
    );
  }

  Widget content() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          color: Color(0xFF62AAE5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: 500,
                height: 180,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "From",
                        icon: Icon(
                          Icons.radio_button_checked_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "To",
                        icon: Icon(
                          Icons.radio_button_checked_outlined,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Departure Time", // Replace with your actual departure time
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MapPage(key: ValueKey("map_page"))),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: Text("Go"),
                  ),
                ],
              ),
              Container(
                height: 70,
                width: 70,
                child: Lottie.network(
                  "https://lottie.host/501babca-ac98-4f48-810e-b95af9f01de0/iJLyGIOZR0.json",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
