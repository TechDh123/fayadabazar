// dth_insertion_page.dart

import 'package:faydabazar/dthoperators/dthpaymentpage.dart';
import 'package:flutter/material.dart';// Ensure this path is correct

class DthInsertionPage extends StatefulWidget {
  final String operatorName;

  const DthInsertionPage({super.key, required this.operatorName});

  @override
  State<DthInsertionPage> createState() => _DthInsertionPageState();
}

class _DthInsertionPageState extends State<DthInsertionPage> {
  final TextEditingController _customerIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  List<String> _plans = []; // To store fetched plans

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DTH Operator",
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
          // Adding gradient circles for aesthetics
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
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                        SizedBox(height: 20),
                        // Customer ID/Number Field
                        Text(
                          "* Customer ID/Number",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: _customerIdController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Amount Field with "Get Info" Button
                        Text(
                          "* Amount",
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
                                    controller: _amountController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade100,
                                      contentPadding:
                                      EdgeInsets.only(right: 80), // Space for button
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                  Positioned(
                                    right: 5,
                                    child: ElevatedButton(
                                      onPressed: _fetchPlans, // Fetch plans when clicked
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.blue.shade900,
                                        backgroundColor: Colors.blue.shade50,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        elevation: 0,
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
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 50),
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
                  // Display Plans if available
                  if (_plans.isNotEmpty) ...[
                    SizedBox(height: 30),
                    Text(
                      "Available Plans",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _plans.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Icon(Icons.star, color: Colors.orange),
                            title: Text(_plans[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to fetch plans (simulated)
  void _fetchPlans() {
    String amountText = _amountController.text.trim();
    if (amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter the amount first")),
      );
      return;
    }

    // Simulate fetching plans based on the amount
    double amount = double.tryParse(amountText) ?? 0.0;
    List<String> fetchedPlans;

    if (amount < 500) {
      fetchedPlans = [
        'Basic Plan - ₹300/month',
        'Standard Plan - ₹400/month',
      ];
    } else if (amount >= 500 && amount < 1000) {
      fetchedPlans = [
        'Premium Plan - ₹800/month',
        'Gold Plan - ₹950/month',
      ];
    } else {
      fetchedPlans = [
        'Platinum Plan - ₹1200/month',
        'Diamond Plan - ₹1500/month',
      ];
    }

    setState(() {
      _plans = fetchedPlans;
    });
  }

  // Function to validate inputs and navigate to Payment Page
  void _submitForm() {
    String customerId = _customerIdController.text.trim();
    String amountText = _amountController.text.trim();

    if (customerId.isEmpty || amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all the required fields")),
      );
      return;
    }

    double amount = double.tryParse(amountText) ?? 0.0;
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid amount")),
      );
      return;
    }

    // Navigate to Payment Page, passing necessary data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DthPaymentPage(
          operatorName: widget.operatorName,
          customerId: customerId,
          amount: amountText,
        ),
      ),
    );
  }
}
