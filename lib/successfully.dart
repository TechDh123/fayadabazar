import 'package:flutter/material.dart';

class Successfully extends StatefulWidget {
  const Successfully({super.key});

  @override
  State<Successfully> createState() => _SuccessfullyState();
}

class _SuccessfullyState extends State<Successfully> {
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
                    "Successfully",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: 25),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.0),
                    child: Text(
                      "Your password has been updated Successfully, please change your ",
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
                      "password regularly to avoid this from happening",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.03,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 70,),
                  Image.asset("assets/images/r1.png",height: 200,width: 250,),
                  SizedBox(height: 70,),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                      child: ElevatedButton(onPressed: (){

                      },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                          child: Text("CONTINUE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
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

                ],
              ),
            ),
          );
        }));
  }
}
