import 'package:flutter/material.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(builder: (context, constraints) {
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;

          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Check Your Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: 25),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.0),
                    child: Text(
                      "We have send the reset password to the email address",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: width * 0.03,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                      "faydabazarhr1@gmail.com",
                      style: TextStyle(
                       fontWeight: FontWeight.bold,
                        fontSize: width * 0.03,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 70,),
                  Image.asset("assets/images/emailv.png",height: 150,width: 150,),
                  SizedBox(height: 70,),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                      child: ElevatedButton(onPressed: (){

                      },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                          child: Text("OPEN YOUR EMAIL",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                      child: ElevatedButton(onPressed: (){

                      },style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: Colors.black, width: 2.0), )),
                          child: Text("BACK TO LOGIN",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You have not received the email?", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
                        },
                        child: Text(
                          "Resend",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.orange,
                            fontSize: width * 0.04,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
