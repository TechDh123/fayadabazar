import 'package:flutter/material.dart';

class NewBusinessProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Painting Services',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Main profile card
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Business Name and Rating
                    Text(
                      'Wings Tower',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '120 Ratings',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Rating, Location and Distance
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[700], size: 20),
                        SizedBox(width: 4),
                        Text(
                          '4.9',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.location_on, color: Colors.blue, size: 18),
                        SizedBox(width: 4),
                        Text(
                          'Jakarta, India',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Jai Hind Cross Road Man – 12.1 km',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Availability
                    Text(
                      'Available Until 7:00 pm',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Action buttons inside the container, using Wrap
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        children: [
                          // Using Wrap to automatically handle overflow
                          ElevatedButton.icon(
                            icon: Icon(Icons.call, color: Colors.white,size: 20,),
                            label: Text("Call Now", style: TextStyle(fontSize: 10)),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),

                          // Chat Button
                          ElevatedButton.icon(
                            icon: Icon(Icons.chat, color: Colors.white,size: 20,),
                            label: Text("Chat"),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),

                          // Direction Button
                          // Make Direction Button more flexible
                          ElevatedButton.icon(
                            icon: Icon(Icons.directions, color: Colors.white,size: 0,),
                            label: Text("Direction", style: TextStyle(fontSize: 10)),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[700],

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // All Images Button

            ],
          ),
        ),
      ),
    );
  }
}
