import 'package:flutter/material.dart';

class SearchOperator extends StatefulWidget {
  const SearchOperator({super.key});

  @override
  State<SearchOperator> createState() => _SearchOperatorState();
}

class _SearchOperatorState extends State<SearchOperator> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _municipalities = [
    'Gwalior Municipal Corporation',
    'Jabalpur Municipal Corporation',
    'New Delhi Municipal Corporation',
    'Indore Municipal Corporation',
    'Ludhiana Municipal Corporation',
    'Ujjain Nagar Nigam - PHED',
    'Uttarakhand Jal Sansthan',
    'Municipal Corporation Jalandhar',
    'Delhi Jal Board',
    'Bhopal Municipal Corporation'
  ];
  List<String> _filteredMunicipalities = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list to show all municipalities initially
    _filteredMunicipalities = _municipalities;
  }

  void _filterMunicipalities(String query) {
    setState(() {
      if (query.isEmpty) {
        // Show all municipalities if the search query is empty
        _filteredMunicipalities = _municipalities;
      } else {
        // Filter the list based on the search query (case-insensitive)
        _filteredMunicipalities = _municipalities
            .where((municipality) =>
            municipality.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Fayda',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                    fontSize: 30),
              ),
              TextSpan(
                text: 'bazar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Operator Field
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterMunicipalities, // Update filter on input
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  labelText: 'Search Operator',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30), // Space between fields

            // Municipal Corporation Fields
            Column(
              children: _filteredMunicipalities.map((municipality) {
                return _buildMunicipalTile(municipality, Icons.location_city);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build ListTiles for Municipal Corporations
  Widget _buildMunicipalTile(String label, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          // Action when the tile is tapped (optional)
        },
      ),
    );
  }
}
