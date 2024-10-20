import 'package:flutter/material.dart';

class GasBillOperators extends StatefulWidget {
  const GasBillOperators({super.key});

  @override
  State<GasBillOperators> createState() => _GasBillOperatorsState();
}

class _GasBillOperatorsState extends State<GasBillOperators> {
  int? selectedOperator; // Change from String? to int?
  final List<Map<String, dynamic>> operators = [
    {"value": 0, "name": "Select Operator"},
    {"value": 52, "name": "Gujarat Gas Company"},
    {"value": 145, "name": "IndianOil - Adani Gas"},
    {"value": 84, "name": "Unique Central Piped Gases"},
    {"value": 40, "name": "Mahanagar Gas"},
    {"value": 81, "name": "Sabarmati Gas"},
    {"value": 85, "name": "Vadodara Gas"},
    {"value": 83, "name": "Tripura Natural Gas"},
    {"value": 120, "name": "Maharashtra Natural Gas"},
    {"value": 144, "name": "Charotar Gas Sahakari Mandali"},
    {"value": 82, "name": "Siti Energy"},
    {"value": 143, "name": "Central UP Gas Limited"},
    {"value": 80, "name": "Haryana City Gas"},
    {"value": 142, "name": "Aavantika Gas"},
    {"value": 53, "name": "Indraprastha Gas"},
    {"value": 78, "name": "Adani Gas - GUJARAT"},
    {"value": 79, "name": "Adani Gas - HARYANA"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Gas Bill Payment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isPortrait = constraints.maxWidth < constraints.maxHeight;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  _inputField(
                    label: 'Select The Operator',
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                contentPadding: EdgeInsets.only(
                                    right: 80), // Space for button
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            Positioned(
                              right: 5,
                              child: OutlinedButton(
                                onPressed: () {
                                  // Logic for "Get Info"
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                  side: BorderSide(
                                      color: Colors.blue.shade900,
                                      width: 1),
                                ),
                                child: Text(
                                  "Get Info",
                                  style: TextStyle(fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.teal, Colors.green],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Calculate EMI Logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: isPortrait ? 20 : 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _inputField({
    required String label,
    String? hintText,
    String? suffixText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 2), // Black border
            color: Colors.grey.shade100,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>( // Change to int
              isExpanded: true,
              value: selectedOperator,
              hint: Text(hintText ?? ''),
              items: operators.map((operator) {
                return DropdownMenuItem<int>( // Change to int
                  value: operator["value"],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(operator["name"]),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedOperator = newValue; // Change to int
                });
              },
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(Icons.arrow_drop_down, color: Colors.teal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
