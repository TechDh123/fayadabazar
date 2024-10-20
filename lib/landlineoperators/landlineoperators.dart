// landlineoperator.dart

import 'package:flutter/material.dart';

import 'Mtnldelhiinsertion.dart';
 // Updated import

class LandlineOperator extends StatefulWidget {
  const LandlineOperator({super.key});

  @override
  State<LandlineOperator> createState() => _LandlineOperatorState();
}

class _LandlineOperatorState extends State<LandlineOperator> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _operators = [
    'MTNL - Delhi',
    'BSNL - Individual',
    'Airtel',
    'MTNL - Mumbai',
    'BSNL - Corporate',
    'Reliance',
    'Tata Docomo CDMA',
  ];
  List<String> _filteredOperators = [];

  @override
  void initState() {
    super.initState();
    _filteredOperators = _operators;
  }

  void _filterOperators(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredOperators = _operators;
      } else {
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
        title: Text(
          "Landline Operators",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
                  onChanged: _filterOperators,
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
              const SizedBox(height: 30),
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
          // Navigate to the Generic Insertion Page, passing the operator name
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LandlineInsertionPage(operatorName: label),
            ),
          );
        },
      ),
    );
  }
}
