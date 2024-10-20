import 'package:flutter/material.dart';

class OperatorDropdown extends StatefulWidget {
  @override
  _OperatorDropdownState createState() => _OperatorDropdownState();
}

class _OperatorDropdownState extends State<OperatorDropdown> {
  String? selectedOperator;
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
      appBar: AppBar(title: Text('Select Gas Operator')),
      body: Center(
        child: DropdownButton<String>(
          value: selectedOperator,
          hint: Text("Select Operator"),
          onChanged: (String? newValue) {
            setState(() {
              selectedOperator = newValue;
              // Call your onchange function here
              onchangeOperatorBill(newValue);
            });
          },
          items: operators.map<DropdownMenuItem<String>>((operator) {
            return DropdownMenuItem<String>(
              value: operator['value'].toString(),
              child: Text(operator['name']),
            );
          }).toList(),
        ),
      ),
    );
  }

  void onchangeOperatorBill(String? operatorValue) {
    // Implement your function logic here
    print("Selected operator: $operatorValue");
  }
}

void main() {
  runApp(MaterialApp(
    home: OperatorDropdown(),
  ));
}
