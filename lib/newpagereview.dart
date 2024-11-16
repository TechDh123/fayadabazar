import 'package:flutter/material.dart';

class BusinessProfilePage extends StatefulWidget {
  @override
  _BusinessProfilePageState createState() => _BusinessProfilePageState();
}

class _BusinessProfilePageState extends State<BusinessProfilePage> {
  int _selectedTabIndex = 0; // Track the selected tab index

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ServicesPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Fayda',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Text('bazar',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ahmedabad',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Hotel near me',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/26.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wings Tower',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            SizedBox(width: 5),
                            Text('4.9',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(width: 10),
                            Text('Kankaria',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Text('Ahmedabad, India',
                            style: TextStyle(color: Colors.white)),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.white, size: 18),
                            Text('Jail Road - 12.1 km',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Text(
                          'Available Until 7:00 pm',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.call,
                              color: Colors.white), // Icon color set to white
                          label: Text(
                            "Call Now",
                            style: TextStyle(
                                color: Colors.white), // Text color set to white
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // Background color set to blue
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton.icon(
                          icon: Icon(Icons.chat,
                              color: Colors.white), // Icon color set to white
                          label: Text(
                            "Chat",
                            style: TextStyle(
                                color: Colors.white), // Text color set to white
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .blueAccent, // Keep background color as blueAccent
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => _onTabSelected(0),
                            child: Column(
                              children: [
                                Text('Overview',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: _selectedTabIndex == 0
                                            ? Colors.black
                                            : Colors.grey[600])),
                                if (_selectedTabIndex == 0)
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    height: 2,
                                    width: 60,
                                    color: Colors.black,
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _onTabSelected(1),
                            child: Column(
                              children: [
                                Text('Services',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: _selectedTabIndex == 1
                                            ? Colors.black
                                            : Colors.grey[600])),
                                if (_selectedTabIndex == 1)
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    height: 2,
                                    width: 60,
                                    color: Colors.black,
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _onTabSelected(2),
                            child: Column(
                              children: [
                                Text('Reviews',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: _selectedTabIndex == 2
                                            ? Colors.black
                                            : Colors.grey[600])),
                                if (_selectedTabIndex == 2)
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    height: 2,
                                    width: 60,
                                    color: Colors.black,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      if (_selectedTabIndex == 0) ...[
                        Row(
                          children: List.generate(5,
                              (index) => Icon(Icons.star, color: Colors.amber)),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Address',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            ElevatedButton.icon(
                              icon: Icon(Icons.directions),
                              label: Text("Get Directions"),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(height: 20),
                        Text('Photos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Image.asset('assets/images/25.png',
                                  width: 90, height: 90, fit: BoxFit.cover),
                              SizedBox(width: 10),
                              Image.asset('assets/images/25.png',
                                  width: 90, height: 90, fit: BoxFit.cover),
                              SizedBox(width: 10),
                              Image.asset('assets/images/25.png',
                                  width: 90, height: 90, fit: BoxFit.cover),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {},
                                child: Text("All Photos",
                                    style: TextStyle(color: Colors.blue)),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("Videos",
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Contact',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text('+91 982408028',
                                style: TextStyle(color: Colors.grey[700])),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Business Hours',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text('Opens at 9:00 am',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            _businessHoursRow('MON', '9:00 am - 6:00 pm'),
                            _businessHoursRow('TUE', '9:00 am - 6:00 pm'),
                            _businessHoursRow('WED', '9:00 am - 6:00 pm'),
                            _businessHoursRow('THU', '9:00 am - 6:00 pm'),
                            _businessHoursRow('FRI', '9:00 am - 6:00 pm'),
                            _businessHoursRow('SAT', '9:00 am - 6:00 pm'),
                            _businessHoursRow('SUN', 'CLOSED'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Year of Establishment',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text('2020',
                                style: TextStyle(color: Colors.grey[700])),
                          ],
                        ),
                        // Add additional UI components for Services or Reviews tabs here if needed.
                      ],
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _businessHoursRow(String day, String hours) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(hours, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}

// Services Page
class ServicesPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {'name': 'Room Service', 'price': 50},
    {'name': 'Gym Access', 'price': 30},
    {'name': 'Spa Treatment', 'price': 100},
    {'name': 'Free Breakfast', 'price': 0},
    {'name': 'Pool Access', 'price': 20},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Services"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(service['name'],
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Price: \$${service['price']}'),
              trailing: Icon(Icons
                  .check_box_outline_blank), // Placeholder for selection icon
              onTap: () {
                // Handle service selection
              },
            ),
          );
        },
      ),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'John Doe',
      'rating': 5,
      'comment': 'Great service and friendly staff!'
    },
    {
      'name': 'Jane Smith',
      'rating': 4,
      'comment': 'Good experience overall, but can improve in some areas.'
    },
    {
      'name': 'Michael Lee',
      'rating': 5,
      'comment': 'Amazing! Will definitely visit again.'
    },
    {
      'name': 'Emma Davis',
      'rating': 3,
      'comment': 'Decent place but a bit crowded.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(
                        review['rating'],
                        (index) =>
                            Icon(Icons.star, color: Colors.amber, size: 18)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    review['comment'],
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
