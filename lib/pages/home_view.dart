import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 0, 36, 107), // Background color #20345c
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
                      location: 'Hilton Head Island, SC',
                      phone: '843-800-4418',
                      url: 'https://example.com/hilton-head',
                    ),
                    _ContactItem(
                      location: 'Myrtle Beach, SC',
                      phone: '843-507-5732',
                      url: 'https://example.com/myrtle-beach',
                    ),
                    _ContactItem(
                      location: 'Wilmington, NC',
                      phone: '910-601-9633',
                      url: 'https://example.com/wilmington',
                    ),
                  ],
                ),

                // Image Slider Section
                ImageSliderWithText(), // Adding the image slider here

                Container(
                  color: Colors.white, // Set the background color to white
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CustomCard(
                            imageUrl: 'assets/images/12.jpg',
                            description: 'Residential',
                            buttonUrl: 'https://example.com/card-2',
                          ),
                          _CustomCard(
                            imageUrl: 'assets/images/1.jpg',
                            description: 'Business',
                            buttonUrl: 'https://example.com/card-2',
                          ),
                          _CustomCard(
                            imageUrl: 'assets/images/11.jpg',
                            description: 'Property Management',
                            buttonUrl: 'https://example.com/card-1',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CustomCard(
                            imageUrl: 'assets/images/5.jpg',
                            description: 'Maintenance Inspection  ',
                            buttonUrl: 'https://example.com/card-2',
                          ),
                          _CustomCard(
                            imageUrl: 'assets/images/3.jpg',
                            description: 'Repairs',
                            buttonUrl: 'https://example.com/card-2',
                          ),
                          _CustomCard(
                            imageUrl: 'assets/images/6.jpg',
                            description: 'Commercial Flat Roof',
                            buttonUrl: 'https://example.com/card-2',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                ClientFeedbackSection(),
                Footer(),

                // Add more content here if needed
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
    'assets/images/1.jpg', // replace with your images
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/9.jpg',
    'assets/images/8.jpg',
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
      height: 550,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Opacity(
                opacity: 0.8,
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
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Best Installation, Best Warranties, Best Service.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
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
                  'Guided Insurance Process',
                  style: TextStyle(
                    color: Colors.white,
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
                SizedBox(height: 20),
                Text(
                  'Variety Of Financing Options',
                  style: TextStyle(
                    color: Colors.white,
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
                SizedBox(height: 20),
                Text(
                  'Industry-leading Warranty Options',
                  style: TextStyle(
                    color: Colors.white,
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
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Action to perform on button press
                  },
                  child: Text('BOOK AN INSPECTION'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                )
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

class _CustomCard extends StatelessWidget {
  final String imageUrl; // Represents the asset path
  final String description;
  final String buttonUrl;

  const _CustomCard({
    required this.imageUrl,
    required this.description,
    required this.buttonUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Card background color set to white
      elevation: 5, // Optional: Add shadow for better appearance
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners for the card
      ),
      child: Container(
        width: 200,
        height: 200, // Adjust height as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                      12)), // Rounded corners for the top part of the image
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors
                      .black, // Text color changed to black for better readability
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final Uri uri = Uri.parse(buttonUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch $buttonUrl')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button background color set to blue
                ),
                child: Text('More Info'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClientFeedbackSection extends StatefulWidget {
  @override
  _ClientFeedbackSectionState createState() => _ClientFeedbackSectionState();
}

class _ClientFeedbackSectionState extends State<ClientFeedbackSection> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _cardData = [
    {
      'image': 'assets/images/B.png',
      'name': 'Brian Rosillio',
      'rating': 5,
      'description': 'Amazing service!',
      'logo': 'assets/images/G.png',
      'time': '2 hours ago',
    },
    {
      'image': 'assets/images/F.png',
      'name': 'Fyang Manzalo',
      'rating': 4.0,
      'description': 'Very satisfied with the service.',
      'logo': 'assets/images/G.png',
      'time': '1 day ago',
    },
    {
      'image': 'assets/images/A.png',
      'name': 'Angeline Deguzman',
      'rating': 4.5,
      'description': 'Very satisfied with the service.',
      'logo': 'assets/images/G.png',
      'time': '2 day ago',
    },
    {
      'image': 'assets/images/k.jpg',
      'name': 'Karen Lagumbay',
      'rating': 5.0,
      'description': 'Amazing Service.',
      'logo': 'assets/images/G.png',
      'time': '2 day ago',
    },
    {
      'image': 'assets/images/B.png',
      'name': 'Garen Baron',
      'rating': 5.0,
      'description': 'Very satisfied with the product.',
      'logo': 'assets/images/G.png',
      'time': '3 day ago',
    },
    {
      'image': 'assets/images/FF.png',
      'name': 'Client 2',
      'rating': 4.5,
      'description': 'Very satisfied with the product.',
      'logo': 'assets/images/G.png',
      'time': '3 day ago',
    },
    {
      'image': 'assets/images/E.png',
      'name': 'Ericka Gonzaga',
      'rating': 4.5,
      'description': 'Very satisfied with the product.',
      'logo': 'assets/images/G.png',
      'time': '4 day ago',
    },
    {
      'image': 'assets/images/A.png',
      'name': 'Adrian Lazo',
      'rating': 5.0,
      'description': 'Very satisfied with the product.',
      'logo': 'assets/images/G.png',
      'time': '4 day ago',
    },
    {
      'image': 'assets/images/F.png',
      'name': 'Fernandez Manalo',
      'rating': 4.0,
      'description': 'Very satisfied with the product.',
      'logo': 'assets/images/G.png',
      'time': '4 day ago',
    },
    // Add more card data here
  ];
  void _nextCard() {
    setState(() {
      if (_currentIndex < _cardData.length - 5) {
        _currentIndex++;
      }
    });
  }

  void _previousCard() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              "What Our Clients Are Saying",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.amber),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < 4 ? Icons.star : Icons.star_half,
                  color: Colors.amber,
                );
              }),
            ),
            SizedBox(height: 4),
            Text(
              "4.5 rating out of 3212 reviews",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Container(
              height: 300, // Adjust height as needed
              child: Stack(
                children: [
                  Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (_currentIndex + 5 > _cardData.length)
                          ? _cardData.length - _currentIndex
                          : 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: _CardWidget(
                              data: _cardData[_currentIndex + index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _previousCard,
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _nextCard,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  _CardWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        color: Colors.grey[200], // Grey background color
        child: Container(
          width: 250, // Adjust width as needed
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(data['image']),
                radius: 30,
              ),
              SizedBox(height: 8),
              Text(
                data['name'],
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 4),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < data['rating'].toInt()
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.amber,
                  );
                }),
              ),
              SizedBox(height: 8),
              Text(
                data['description'],
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    data['logo'],
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  Text(
                    data['time'],
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ],
          ),
        ),
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
