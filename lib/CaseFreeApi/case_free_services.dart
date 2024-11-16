import 'dart:convert';
import 'package:http/http.dart' as http;

class CashFreeService {
  final String clientId = '{Client ID}';
  final String clientSecret = '{Client Secret Key}';
  final String environment = 'PRODUCTION'; // or 'TEST' if needed

  Future<void> createOrder() async {
    var url = Uri.parse('https://api.cashfree.com/api/v2/cashfree/push');

    var requestBody = {
      "order_amount": "1",
      "order_currency": "INR",
      "customer_details": {
        "customer_id": "node_sdk_test",
        "customer_name": "",
        "customer_email": "example@gmail.com",
        "customer_phone": "9999999999"
      },
      "order_meta": {
        "return_url": "https://test.cashfree.com/pgappsdemos/return.php?order_id=order_123"
      },
      "order_note": ""
    };

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'X-Client-Id': clientId,
        'X-Client-Secret': clientSecret,
        'X-Environment': environment
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
    } else {
      print('Error creating order: ${response.statusCode} - ${response.body}');
    }
  }
}
