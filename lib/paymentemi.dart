import 'package:flutter/material.dart';
import 'dart:ui'; // For glass effect (blur)

class MyWalletPage extends StatefulWidget {
  @override
  _MyWalletPageState createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  String? selectedPaymentMethod;
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Adjust when keyboard is shown
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back, color: Colors.black, size: 30),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Fayda",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 28,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Bazar",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            tooltip: 'Search',
            iconSize: 30,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            tooltip: 'Notifications',
            iconSize: 30,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white, // Set background color to white
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                // Glassmorphism Wallet Info Card
                _buildGlassCard(
                  child: Column(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          size: 100, color: Colors.blueAccent),
                      SizedBox(height: 10),
                      Text(
                        "Available Cash in Wallet",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Rs. 0.00",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Divider(color: Colors.black.withOpacity(0.8)),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Payment Gateway:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPaymentOption('assets/images/phonepe.png', 'PhonePe', 'PhonePe'),
                    _buildPaymentOption('assets/images/gpay.png', 'Google Pay', 'Google Pay'),
                    _buildPaymentOption('assets/images/paytm.png', 'Paytm', 'Paytm'),
                  ],
                ),
                SizedBox(height: 40),
                _buildAmountField(),
                SizedBox(height: 20),
                _buildNetAmountField(),
                SizedBox(height: 20),
                Text(
                  "Surcharge Rs. 0.00%",
                  style: TextStyle(fontSize: 16, color: Colors.redAccent),
                ),
                SizedBox(height: 40),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // More opaque for clarity
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6), // More opaque
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String imagePath, String label, String value) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedPaymentMethod = value;
            });
          },
          child: Image.asset(imagePath, height: 50, width: 50),
        ),
        SizedBox(height: 10),
        Text(label, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        Radio<String>(
          value: value,
          groupValue: selectedPaymentMethod,
          onChanged: (String? newValue) {
            setState(() {
              selectedPaymentMethod = newValue;
            });
          },
          activeColor: Colors.blueAccent,
        ),
      ],
    );
  }

  Widget _buildAmountField() {
    return TextField(
      controller: amountController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        labelText: "Add Cash From Payment Gateway",
        labelStyle: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.9)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildNetAmountField() {
    return TextField(
      readOnly: true,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        labelText: "Net Amount",
        labelStyle: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.9)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {
        // Add functionality for adding cash
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        backgroundColor: Colors.blueAccent, // Solid button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
      ),
      child: Container(
        width: double.infinity,
        height: 30,
        alignment: Alignment.center,
        child: Text(
          "Add Cash",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
