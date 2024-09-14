import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 36, 107),
        title: Center(
          child: Text(
            'Quality Roofing Solutions for a Stronger, Better Home.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image on the left and text on the right
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image on the left with floating effect
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/7.jpg', // Replace with your asset path
                      width: 500, // Adjust the width as needed
                      height: 500, // Adjust the height as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.0), // Space between the image and text
                  // Text on the right
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monge Remodeling',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16.0), // Space below the title
                        Text(
                          'Welcome to Monge Remodeling, where we bring a blend of expertise, craftsmanship, and dedication to every roofing project. With a strong reputation in the remodeling industry, we specialize in roofing installation and are committed to delivering exceptional results that enhance both the functionality and aesthetics of your property.',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 16.0), // Space between sections
                        Text(
                          'Our Story',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Founded with a vision to provide top-tier remodeling services, Monge Remodeling has grown into a trusted name in roofing installation. Our journey began with a passion for quality craftsmanship and a commitment to customer satisfaction. Over the years, we have built a team of skilled professionals who share our dedication to excellence and our goal of exceeding client expectations.',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 16.0), // Space between sections
                        Text(
                          'Our Mission',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'At Monge Remodeling, our mission is to offer superior roofing solutions that combine durability, style, and value. We believe that a roof should do more than just protect—it should also enhance the overall look and feel of your home or business. Our goal is to provide our clients with roofing systems that not only meet their needs but also stand the test of time.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0), // Space between sections
              // Text on the left and image on the right, with white background
              Container(
                color: Colors.white, // Set the background to white
                padding: const EdgeInsets.all(
                    16.0), // Add padding inside the container
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text on the left
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Values',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'At Monge Remodeling, we believe in integrity, quality, and customer satisfaction. These values guide us in every project we undertake, from small repairs to large installations. We take pride in using only the highest-quality materials and ensuring that our work meets the highest standards. Our team is dedicated to delivering excellent craftsmanship and outstanding service.',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Why Choose Us?',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Choosing Monge Remodeling means choosing a partner who is committed to transforming your home with expertise and care. We understand that your home is your most significant investment, and we aim to provide roofing solutions that not only protect but also enhance your property’s value and curb appeal.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0), // Space between the text and image
                    // Image on the right with floating effect
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/8.jpg', // Replace with your asset path
                        width: 500, // Adjust the width as needed
                        height: 500, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
