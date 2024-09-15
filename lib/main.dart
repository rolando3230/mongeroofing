import 'package:flutter/material.dart';
import 'package:mongeroofing/pages/ContactUsView.dart';
import 'package:mongeroofing/pages/aboutus_view.dart';
import 'package:mongeroofing/pages/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This variable will hold the index of the currently selected page
  int _selectedIndex = 0;

  // Define the pages for each section
  final List<Widget> _pages = [
    HomeView(),
    AboutUsView(),
    ContactUsView(),
  ];

  // Define the titles of the sections
  final List<String> _sectionTitles = [
    'HOME',
    'ABOUT US',
    'CONTACT US',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set the background color of AppBar
        elevation: 0, // Remove the shadow
        toolbarHeight: 0, // Remove AppBar content by setting height to zero
      ),
      body: Column(
        children: [
          // Top navigation bar with an asset image on the left
          Container(
            color: Colors.white, // Background color for the navigation bar
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                // Asset image on the left side
                Padding(
                  padding: const EdgeInsets.fromLTRB(110, 8, 0, 0),
                  child: Image.asset(
                    'assets/images/monge.jpg',
                    height: 120,
                    width: 150,
                  ),
                ),
                SizedBox(
                    width:
                        290), // Reduce the spacing between the image and the navigation items
                // Navigation items
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _sectionTitles
                        .asMap()
                        .entries
                        .map((entry) => _buildNavItem(entry.key, entry.value))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }

  // Build each navigation item
  Widget _buildNavItem(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10), // Adjust padding to bring items closer
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selectedIndex == index
                  ? Color(0xFF080494)
                  : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight:
                _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
            color: _selectedIndex == index ? Color(0xFF080494) : Colors.black,
          ),
        ),
      ),
    );
  }
}
