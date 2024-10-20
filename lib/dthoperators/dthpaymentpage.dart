// dth_payment_page.dart

import 'package:flutter/material.dart';

class DthPaymentPage extends StatefulWidget {
  final String operatorName;
  final String customerId;
  final String amount;

  const DthPaymentPage({
    super.key,
    required this.operatorName,
    required this.customerId,
    required this.amount,
  });

  @override
  State<DthPaymentPage> createState() => _DthPaymentPageState();
}

class _DthPaymentPageState extends State<DthPaymentPage> {
  bool _useWallet = false;
  double _walletBalance = 123.45; // Example wallet balance

  @override
  Widget build(BuildContext context) {
    double totalAmount = double.tryParse(widget.amount) ?? 0.0;
    double finalAmount =
    _useWallet ? (totalAmount - _walletBalance).clamp(0.0, totalAmount) : totalAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF0F4F8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              // Title Section
              Row(
                children: [
                  Text(
                    widget.operatorName,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.phone, color: Colors.green, size: 40),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Amount Container
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '₹ ${widget.amount}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Payment Details
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.7),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRow('Operator', widget.operatorName),
                    Divider(),
                    _buildRow('Customer ID', widget.customerId),
                    Divider(),
                    _buildRow('Amount', '₹ ${widget.amount}'),
                    Divider(),
                    _buildRow('Applied Coupon', '0'),
                    Divider(),
                    _buildRow('My Wallet Balance', '₹ $_walletBalance',
                        walletBalance: true),
                    Divider(),
                    Row(
                      children: [
                        Radio<bool>(
                          value: true,
                          groupValue: _useWallet,
                          onChanged: (bool? value) {
                            setState(() {
                              _useWallet = value ?? false;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        Text(
                          'Use Wallet Balance',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    _buildRow(
                        'Total Amount to be Paid', '₹ ${finalAmount.toStringAsFixed(2)}'),
                    SizedBox(height: 20),
                    // Proceed Button
                    Center(
                      child: ElevatedButton(
                        onPressed: _processPayment,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                          shadowColor:
                          Colors.blueAccent.withOpacity(0.5),
                          backgroundColor: Color(0xFF0083B0),
                        ),
                        child: Text(
                          'PROCEED TO PAY',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value,
      {bool walletBalance = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              )),
          walletBalance
              ? Container(
            padding:
            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
          )
              : Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Function to process payment
  void _processPayment() {
    // Implement your payment logic here
    // For demonstration, we'll show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text(
              'Your payment of ₹ ${widget.amount} for ${widget.operatorName} was successful.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Navigate back to the main page or reset the form
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }
}
