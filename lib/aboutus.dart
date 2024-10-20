import 'package:flutter/material.dart';
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("About Us",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),) ,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/fblogo.png",height: 150,width: 150),
              SizedBox(height: 16,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "‣ Fayda Bazar is India's No.1 Local Search Engine providing local search related services to users across India through "
                              "multiple platform including Websites, Mobile Website, Apps (Android, IOS),Telephone. These services aim to make many day-to-day tasks conveniently efficient and accessible for users through a single app. In doing so, it has transitioned from being a "
                              "provider of purely local search and relevant information to being an enabler of such transactions. This app will provide information about merchants and discounts offered by them. So that the users of this app will be directly in touch with the traders and will be able to benefit by purchasing the goods and "
                              "services they need. The organization also aims to create a seamless relationship between users and businesses through its real-time chat messenger. ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 20
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
    );
  }
}
