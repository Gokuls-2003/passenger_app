import 'package:flutter/material.dart';
import 'package:passenger_app/service/bottom_nav.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  int currentPage = 2; 

  @override
void initState() {
  super.initState();
  currentPage = 1; 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: _buildUI(),
      bottomNavigationBar: Curved_Bottom(currentIndex: 2),
    );
  }

  Widget _buildUI() {
    return SafeArea(
        child: Column(
      children: [Search()],
    ));
  }

  Widget Search() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          children: [
            Text(
              "Search",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search_rounded),
                    hintText: 'Type to search...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
