// landline_insertion_page.dart

import 'package:flutter/material.dart';

import 'mtnldelhipayment.dart'; // Import the Payment Page

class LandlineInsertionPage extends StatefulWidget {
  final String operatorName;

  const LandlineInsertionPage({super.key, required this.operatorName});

  @override
  State<LandlineInsertionPage> createState() => _LandlineInsertionPageState();
}

class _LandlineInsertionPageState extends State<LandlineInsertionPage> {
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _telephoneNumberController = TextEditingController();
  final TextEditingController _rechargeAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Landline Operator",
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.shade100,
                  Colors.orange.shade100,
                ],
              ),
            ),
          ),
          // Gradient Circles for Aesthetics
          Positioned(
            bottom: -40,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.blue.shade300, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.orange.shade300, Colors.transparent],
                ),
              ),
            ),
          ),
          // Body Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Operator Name and Icon
                        Row(
                          children: [
                            Text(
                              widget.operatorName,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.sim_card,
                              size: 40,
                              color: Colors.blue.shade700,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Change Operator Button
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade600,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "Change Operator",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Account Number Field
                        Text(
                          "* Account Number",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: _accountNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Telephone Number Field
                        Text(
                          "* Telephone Number",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: _telephoneNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "* Recharge Amount",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextFormField(
                                    controller: _rechargeAmountController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade100,
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                  Positioned(
                                    right: 5,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // Logic for "Get Info"
                                        // For example, you can show a dialog with information
                                        _showInfoDialog();
                                      },
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.blue.shade900,
                                        backgroundColor: Colors.blue.shade50,
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        side: BorderSide(
                                            color: Colors.blue.shade900, width: 1),
                                      ),
                                      child: Text(
                                        "Get Info",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        // Submit Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate inputs and navigate to Payment Page
                              if (_validateInputs()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LandlinePaymentPage(
                                      operatorName: widget.operatorName,
                                      rechargeAmount: _rechargeAmountController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                              backgroundColor: Colors.orange.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to validate inputs
  bool _validateInputs() {
    if (_accountNumberController.text.isEmpty ||
        _telephoneNumberController.text.isEmpty ||
        _rechargeAmountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all the required fields")),
      );
      return false;
    }
    // Add more validation as needed
    return true;
  }

  // Function to show info dialog
  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Recharge Info'),
          content: Text('Details about the recharge will be shown here.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
