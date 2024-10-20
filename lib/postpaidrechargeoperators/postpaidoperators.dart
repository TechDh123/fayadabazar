import 'package:flutter/material.dart';
class PostPaidOperators extends StatefulWidget {
  const PostPaidOperators({super.key});

  @override
  State<PostPaidOperators> createState() => _PostPaidOperatorsState();
}

class _PostPaidOperatorsState extends State<PostPaidOperators> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _operators = [
    'Vodafone',
    'Reliance Jio',
    'Airtel',
    'Idea',
    'Tata Docomo CDMA',
    'Tata Docomo GSM',
    'BSNL Mobile',

  ];
  List<String> _filteredOperators = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list to show all operators initially
    _filteredOperators = _operators;
  }

  void _filterOperators(String query) {
    setState(() {
      if (query.isEmpty) {
        // Show all operators if the search query is empty
        _filteredOperators = _operators;
      } else {
        // Filter the list based on the search query (case-insensitive)
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
        // Adding gradient to the AppBar
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.deepPurpleAccent,
        title: Text("Mobile Postpaid Recharge",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueGrey[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Operator Field with improved design
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
                  onChanged: _filterOperators, // Update filter on input
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                    labelText: 'Search Operator',
                    labelStyle: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 30), // Space between fields

              // Operator Fields
              Column(
                children: _filteredOperators.map((operator) {
                  return _buildOperatorCard(operator);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build Cards for Operators
  Widget _buildOperatorCard(String label) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(Icons.electrical_services, color: Colors.deepPurple),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.deepPurple,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          // Action when the tile is tapped (optional)
        },
      ),
    );

  }
}
