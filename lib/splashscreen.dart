import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 5), () {
      // Uncomment and replace with your next screen
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const Enteredscreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(hexColor('#FFFFFF')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.15),
              Lottie.asset(
                "assets/images/splashscreen.json",
                width: 499,
                height: 410,
              ),
              Column(
                children: [
                  Text(
                    "Welcome To Faydabazar",
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.075,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "We Promote your business!!",
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: screenWidth * 0.043,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int hexColor(String colorHexCode) {
  String colorNew = '0xff' + colorHexCode.replaceAll('#', '');
  int colorInt = int.parse(colorNew);
  return colorInt;
}
