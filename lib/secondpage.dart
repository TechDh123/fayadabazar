import 'package:flutter/material.dart';

// Assuming CategoryIcon is in 'category.dart'
import 'category.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // List of all categories excluding 'View More'
  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.flight, 'label': 'Flights Tickets'},
    {'icon': Icons.bus_alert, 'label': 'Bus Tickets'},
    {'icon': Icons.train, 'label': 'Train Tickets'},
    {'icon': Icons.movie, 'label': 'Movie tickets'},
    {'icon': Icons.event, 'label': 'Event tickets'},
    {'icon': Icons.train_rounded, 'label': 'Metro tickets'},
  ];

  // List of filtered categories based on the search query
  List<Map<String, dynamic>> _filteredCategories = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredCategories = _categories; // Initialize with all categories
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredCategories = _categories.where((category) {
        return category['label'].toLowerCase().contains(_searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size and orientation
    final size = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Fayda',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: 'bazar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.blue),
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: _updateSearchQuery, // Update search query on change
                ),
                const SizedBox(height: 50),
                Text(
                  "Popular Services",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: isPortrait ? 20 : 24,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Light background color
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: Wrap(
                    spacing: isPortrait ? 40 : 30,
                    runSpacing: 20,
                    children: [
                      ..._filteredCategories.map((category) {
                        return CategoryIcon(
                          icon: category['icon'],
                          label: category['label'],
                        );
                      }).toList(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ThirdPage()),
                          );
                        },
                        child: CategoryIcon(
                          icon: Icons.view_list_rounded,
                          label: 'View More',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40.0,
          color: Colors.blue,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}


