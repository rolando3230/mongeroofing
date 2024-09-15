import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF080494),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Aligns children to the top
                  children: [
                    _ContactItem(
                      location: 'Lafayette La',
                      phone: '705-0133-77035466',
                      url: 'https://example.com/hilton-head',
                    ),
                    _ContactItem(
                      location: 'Baton Rouge La ',
                      phone: '708-5225-8884477',
                      url: 'https://example.com/myrtle-beach',
                    ),
                  ],
                ),
                ImageSliderWithText(), // Adding the image slider here
                ContactForm(),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageSliderWithText extends StatefulWidget {
  @override
  _ImageSliderWithTextState createState() => _ImageSliderWithTextState();
}

class _ImageSliderWithTextState extends State<ImageSliderWithText> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/2.jpg',
  ];
  @override
  void initState() {
    super.initState();
    // Ensure the PageView is built before starting the timer
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (_pageController.hasClients) {
          if (_currentIndex < _images.length - 1) {
            _currentIndex++;
          } else {
            _currentIndex = 0;
          }
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Opacity(
                opacity: 0.6,
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            },
          ),
          Positioned(
            left: 20.0,
            right: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Contact Our Experts',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'We have established a superior quality roofing business to help add value and protect.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final String location;
  final String phone;
  final String url;

  const _ContactItem({
    required this.location,
    required this.phone,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            location,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text color
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            phone,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white, // White text color
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 36, 107), // Set background color
      padding: EdgeInsets.all(16.0), // Add padding around the footer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Connect With Us',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon('assets/images/fb.png', () {
                // Add Facebook link here
              }),
              SizedBox(width: 16), // Add spacing between icons
              _buildSocialIcon('assets/images/instagram.png', () {
                // Add Instagram link here
              }),
              SizedBox(width: 16), // Add spacing between icons
              _buildSocialIcon('assets/images/linked.jpg', () {
                // Add LinkedIn link here
              }),
              SizedBox(width: 16), // Add spacing between icons
              _buildSocialIcon('assets/images/youtube.png', () {
                // Add YouTube link here
              }),
              SizedBox(width: 16), // Add spacing between icons
              _buildSocialIcon('assets/images/twitter.png', () {
                // Add Twitter link here
              }),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Copyright © 2024 Monge Remodeling. All rights reserved.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              color: Colors.white, // Text color
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath, VoidCallback onPressed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Image.asset(assetPath), // Replace with your asset path
        onPressed: onPressed,
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool isNewRoofSelected = false;
  bool isRoofRepairSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Zip Code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Are you interested in:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Checkbox(
                  value: isNewRoofSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isNewRoofSelected = value!;
                    });
                  },
                ),
                Text('New Roof'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isRoofRepairSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isRoofRepairSelected = value!;
                    });
                  },
                ),
                Text('Roof Repair'),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF080494), // New background color
              ),
              onPressed: () {
                // Handle form submission
              },
              child: Text(
                'Submit',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.white),
              ),
            )),
          ],
        ));
  }
}
