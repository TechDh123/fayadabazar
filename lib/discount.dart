import 'package:flutter/material.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtain screen orientation and width
    final orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine number of columns and spacing based on orientation
    final crossAxisCount = orientation == Orientation.portrait ? 2 : 2;
    final crossAxisSpacing = orientation == Orientation.portrait ? 5.0 : 5.0;
    final mainAxisSpacing = 30.0;

    // Calculate image size based on number of columns and screen width
    final imageSize = (screenWidth / crossAxisCount) - crossAxisSpacing;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discount Restaurants'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10), // Padding around the grid
        itemCount: 16,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing, // Adjust horizontal space
          mainAxisSpacing: mainAxisSpacing, // Vertical space
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Stack for image and like icon
              Stack(
                children: [
                  Container(
                    width: imageSize, // Responsive width
                    height: imageSize * 0.65, // Maintain aspect ratio
                    decoration: BoxDecoration(
                      color: Colors.grey, // Placeholder color
                      borderRadius: BorderRadius.circular(15), // Border radius
                      image: DecorationImage(
                        image: AssetImage("assets/images/26.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.yellowAccent,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5), // Space between image and text
              const Text("Hotels and Restaurants"),
              SizedBox(height: 5), // Space between text and the rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15,
                  ),
                  SizedBox(width: 5), // Space between icons
                  Text("4.7"),
                  SizedBox(width: 5), // Space between icons
                  Icon(
                    Icons.location_on_rounded,
                    size: 17,
                  ),
                  SizedBox(width: 5), // Space between icons
                  Text("Chandkheda"),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}


