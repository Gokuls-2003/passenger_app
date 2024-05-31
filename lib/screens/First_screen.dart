import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({super.key});

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class CarouselItem {
  final String imagePath;
  final String text;

  CarouselItem(this.imagePath, this.text);
}

class _First_ScreenState extends State<First_Screen> {
  int _currentIndex = 0;
  final List<CarouselItem> carouselItems = [
    CarouselItem('assets/parent.png', 'Parent'),
    CarouselItem('assets/passenger.png', 'Passenger'),
  ];

  String? selectedVehicle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            _headerText(),
          ],
        ),
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.yellow,
                  Colors.white,
                ],
                stops: [0.3, 0.6],
              ),
            ),
            child: Stack(children: [
              const Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hi, welcome back",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Hello again, you've been missed",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 350,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Who's Using the app?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Expanded(
                                  child: CarouselSlider(
                                    items: carouselItems.map((item) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Column(
                                            children: [
                                              Image.asset(item.imagePath),
                                              Text(
                                                item.text,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }).toList(),
                                    options: CarouselOptions(
                                      height: 400,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 0.8,
                                      initialPage: _currentIndex,
                                      enableInfiniteScroll: false,
                                      reverse: false,
                                      autoPlay: false,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                      scrollDirection: Axis.horizontal,
                                      pageViewKey:
                                          PageStorageKey('carousel_slider'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: carouselItems.map((item) {
                                    int index = carouselItems.indexOf(item);
                                    return Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _currentIndex == index
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ))))
            ])));
  }
}

  // Widget _User() {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width * 0.80,
  //     height: MediaQuery.of(context).size.height * 0.50,
  //     child: Column(
  //       children: [
  //         GestureDetector(
  //           onTap: () {
  //             _showVehicleSelectionDialog(context);
  //           },
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(35),
  //               boxShadow: const [
  //                 BoxShadow(
  //                   color: Color(0xFFF9D276),
  //                   spreadRadius: 4,
  //                   blurRadius: 2,
  //                 ),
  //               ],
  //             ),
  //             width: double.infinity,
  //             height: 100,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Image.asset(
  //                   "assets/parent.png",
  //                   fit: BoxFit.contain,
  //                   width: 150,
  //                   height: double.infinity,
  //                 ),
  //                 const Expanded(
  //                   child: Center(
  //                     child: Text(
  //                       "I am a Passenger",
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 50,
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(35),
  //             boxShadow: const [
  //               BoxShadow(
  //                 color: Color(0xFFF9D276),
  //                 spreadRadius: 4,
  //                 blurRadius: 2,
  //               ),
  //             ],
  //           ),
  //           width: double.infinity,
  //           height: 100,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Image.asset(
  //                 "assets/passenger.png",
  //                 fit: BoxFit.contain,
  //                 width: 150,
  //                 height: double.infinity,
  //               ),
  //               const Expanded(
  //                 child: Center(
  //                   child: Text(
  //                     "I am a Parent",
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _showVehicleSelectionDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setState) {
  //           return AlertDialog(
  //             title: const Text("Select Vehicle Type"),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: <Widget>[
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     color: selectedVehicle == "Bus"
  //                         ? Colors.yellow.withOpacity(0.2)
  //                         : null,
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   child: RadioListTile<String>(
  //                     title: const Text("Bus"),
  //                     value: "Bus",
  //                     groupValue: selectedVehicle,
  //                     activeColor: Colors.yellow,
  //                     onChanged: (value) {
  //                       setState(() {
  //                         selectedVehicle = value;
  //                       });
  //                     },
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     color: selectedVehicle == "Auto"
  //                         ? Colors.yellow.withOpacity(0.2)
  //                         : null,
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   child: RadioListTile<String>(
  //                     title: const Text("Auto"),
  //                     value: "Auto",
  //                     groupValue: selectedVehicle,
  //                     activeColor: Colors.yellow,
  //                     onChanged: (value) {
  //                       setState(() {
  //                         selectedVehicle = value;
  //                       });
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             actions: <Widget>[
  //               TextButton(
  //                 child: const Text("Cancel"),
  //                 onPressed: () {
  //                   setState(() {
  //                     selectedVehicle = null;
  //                   });
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.yellow, // Background color
  //                 ),
  //                 child: const Text(
  //                   "Confirm",
  //                   style: TextStyle(color: Colors.black), // Text color
  //                 ),
  //                 onPressed: () {
  //                   if (selectedVehicle != null) {
  //                     Navigator.of(context).pop();
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) =>
  //                             Vechile_Type(selectedVehicle: selectedVehicle!),
  //                       ),
  //                     );
  //                   }
  //                 },
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

