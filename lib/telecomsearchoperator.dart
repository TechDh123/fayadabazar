import 'package:flutter/material.dart';

class TelecomSearchOperator extends StatefulWidget {
  const TelecomSearchOperator({super.key});

  @override
  State<TelecomSearchOperator> createState() => _TelecomSearchOperatorState();
}

class _TelecomSearchOperatorState extends State<TelecomSearchOperator> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _operators = [
    'Vodafone',
    'Reliance Jio',
    'Airtel',
    'Idea',
    'Tata Docomo CDMA',
    'Tata Docomo GSM',
    'BSNL Mobile'
  ];
  List<String> _filteredOperators = [];

  @override
  void initState() {
    super.initState();
    // Initially, the filtered list is the same as the complete list of operators
    _filteredOperators = _operators;
  }

  void _filterOperators(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the search query is empty, show all operators
        _filteredOperators = _operators;
      } else {
        // Filter the list of operators based on the search query
        _filteredOperators = _operators
            .where((operator) =>
            operator.toLowerCase().contains(query.toLowerCase()))
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
                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
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
                onChanged: _filterOperators, // Filter the list based on input
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

            // Telecom Operators List
            Column(
              children: _filteredOperators.map((operator) {
                return _buildTelecomTile(operator, Icons.network_cell);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build ListTiles for Telecom Operators
  Widget _buildTelecomTile(String label, IconData icon) {
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
