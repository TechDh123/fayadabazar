  import 'package:faydabazar/payment2.dart';
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import 'package:flutter/material.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfcard/cfcardlistener.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfcard/cfcardwidget.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfcard.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfcardpayment.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfnetbanking.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfnetbankingpayment.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfupi.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfupipayment.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
  import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
  import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
  import 'package:flutter_cashfree_pg_sdk/api/cfupi/cfupiutils.dart';

  class OrderFormPage extends StatefulWidget {
    @override
    _OrderFormPageState createState() => _OrderFormPageState();
  }

  class _OrderFormPageState extends State<OrderFormPage> {
    final _formKey = GlobalKey<FormState>();
    String? customerId,
        customerName,
        customerEmail,
        customerPhone,
        orderId,
        orderCurrency;
    double? orderAmount;

    String? cfOrderId;
    String? sessionId;

    final String clientId = '77001863cd385d3ac6a7130d0a810077';
    final String clientSecret =
        'cfsk_ma_prod_0e70aa93c4d44072697ab69f10826dc9_590513e6';
    // final String environment = 'PRODUCTION'; // or 'TEST'
    CFEnvironment environment = CFEnvironment.SANDBOX;
    var cfPaymentGatewayService = CFPaymentGatewayService();

    Future<void> createOrder() async {
      var url = Uri.parse('https://api.cashfree.com/pg/orders');

      var requestBody = {
        "order_id": orderId,
        "order_amount": orderAmount.toString(),
        "order_currency": orderCurrency,
        "customer_details": {
          "customer_id": customerId,
          "customer_name": customerName,
          "customer_email": customerEmail,
          "customer_phone": customerPhone
        },
        "order_meta": {
          "return_url":
              "https://test.cashfree.com/pgappsdemos/return.php?order_id=$orderId"
        },
        "order_note": ""
      };

      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'X-Client-Id': clientId,
          'X-Client-Secret': clientSecret,
          'x-api-version': '2023-08-01',
          'X-Environment': environment.toString()
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        print('Data:>>>>>>> ${data}');
        print('cf_order_id:${data['cf_order_id']}');
        print('cf_order_id:${data['customer_details']['']}');
        print('cf_order_id:${data['entity']}');
        print('cf_order_id:${data['payment_session_id']}');
        print('cf_order_id:${data['cf_order_id']}');




        cfOrderId = data['cf_order_id'];
        sessionId = data['payment_session_id'];

        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>PaymentsFinal(OrederId: cfOrderId,sessionId: sessionId,) ,));


        // Handle successful order creation (e.g., show a success message)
      } else {
        print('Error creating order: ${response.statusCode} - ${response.body}');
        // Handle error response
      }
    }



    void verifyPayment(String orderId) {
      print("Verify Payment");
    }

    void onError(CFErrorResponse errorResponse, String orderId) {
      print(errorResponse.getMessage());
      print("Error while making payment");
    }

    void cardListener(CFCardListener cardListener) {
      print("Card Listener triggered");
      print(cardListener.getNumberOfCharacters());
      print(cardListener.getType());
      print(cardListener.getMetaData());
    }

    // String orderId = "order_6032i376cpyIuTTVae9vnqfmtgT8Hj";
   // / String paymentSessionId = "session_nfU1ZczDG136bf7N7EQv6C6kL0dZn3Xw8EYtHmpmt0_dqt493wRnYG7PuUEuv96G57DuMOobE39WVnUth3tgd5k_odWFHa8dHIWoFzs3RzHS";
    void receivedEvent(String event_name, Map<dynamic, dynamic> meta_data) {
      print(event_name);
      print(meta_data);
    }

    // upiIntentPay() async {
    //   try {
    //     cfPaymentGatewayService.setCallback(verifyPayment, onError);
    //     var session = createSession();
    //     var upi = CFUPIBuilder().setChannel(CFUPIChannel.INTENT).setUPIID(selectedId).build();
    //     var upiPayment = CFUPIPaymentBuilder().setSession(session!).setUPI(upi).build();
    //     cfPaymentGatewayService.doPayment(upiPayment);
    //   } on CFException catch (e) {
    //     print(e.message);
    //   }
    // }

    CFSession? createSession() {
      try {
        var oid = "${cfOrderId}";
        var spi = "${sessionId}";
        // var oid = "order_18482hmCisOicEvPWfsUSHXwAlp4LjU";
        // var spi = "session_Qhf6IS3AmPOOC1gg7Pz2rkSG1g4So8QRvLovw5WcEbKRKXULMhqFYhNqOchqPwp3hTvwBNPPIbpHRjh5gkwWgsUWw2gO8JPZjfPQwb7IC0sn";
        var session = CFSessionBuilder()
            .setEnvironment(environment)
            .setOrderId(oid)
            .setPaymentSessionId(spi)
            .build();
        return session;


      } on CFException catch (e) {
        print('>>>>>>>>>>>>>>${e.message}');
      }
      return null;
    }

    void submitForm() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        createOrder();
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Create Order'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Customer ID'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter customer ID';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      customerId = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Customer Name'),
                    onSaved: (value) {
                      customerName = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Customer Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter customer email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      customerEmail = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Customer Phone'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter customer phone';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      customerPhone = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order ID'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter order ID';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      orderId = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Amount'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter order amount';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      orderAmount = double.tryParse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Currency'),
                    initialValue: 'INR', // Default to INR
                    onSaved: (value) {
                      orderCurrency = value ?? 'INR';
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: Text('Submit'),
                  ),


                  // InkWell(
                  //   onTap:pay,
                  //     child: Text('pay'))
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
