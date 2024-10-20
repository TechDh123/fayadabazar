import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For platform channels


class PaymentIntegrationPage extends StatefulWidget {
  @override
  _PaymentIntegrationPageState createState() => _PaymentIntegrationPageState();
}

class _PaymentIntegrationPageState extends State<PaymentIntegrationPage> {
  static const platform = MethodChannel('com.example.cashfree/payment');

  Future<void> initiateCashfreePayment() async {
    try {
      final result = await platform.invokeMethod('startPayment', {
        'orderId': 'ORDER_ID_123',
        'orderAmount': '100.0',
        'customerName': 'John Doe',
        'customerPhone': '9876543210',
        'customerEmail': 'john.doe@example.com',
        'paymentMode': 'UPI',
        'appId': 'YOUR_CASHFREE_APP_ID',
        'clientSecret': 'YOUR_CASHFREE_CLIENT_SECRET'
      });
      print('Payment Result: $result');
    } on PlatformException catch (e) {
      print("Failed to initiate payment: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cashfree Payment")),
      body: Center(
        child: ElevatedButton(
          onPressed: initiateCashfreePayment,
          child: Text("Pay Now"),
        ),
      ),
    );
  }
}