import 'package:flutter/material.dart';
class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          elevation: 4,
          title: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Fayda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                    fontSize: 28,
                  ),
                ),
                TextSpan(
                  text: 'bazar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
          ],
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text("Personal Information",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}
