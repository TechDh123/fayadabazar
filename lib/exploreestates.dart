import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreEstates extends StatefulWidget {
  const ExploreEstates({super.key});

  @override
  State<ExploreEstates> createState() => _ExploreEstatesState();
}

class _ExploreEstatesState extends State<ExploreEstates> {
  List<Map<String, dynamic>> estates = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchEstates();
  }

  Future<void> _fetchEstates() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('VendorRegistration')
          .get();

      List<Map<String, dynamic>> fetchedEstates = [];

      for (var doc in querySnapshot.docs) {
        fetchedEstates.add(doc.data() as Map<String, dynamic>);
      }

      setState(() {
        estates = fetchedEstates;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching estates: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.limeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.blue,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Fayda',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: 'bazar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: estates.length,
          itemBuilder: (context, index) {
            var estate = estates[index];
            return EstateCard(
              estateName: estate['firmName'] ?? 'Unknown Firm',
              location: '${estate['cityName']}, ${estate['stateName']}',
              distance: '12.1 km', // Placeholder; modify as needed
              availableUntil: 'Available until ${estate['starttime']} - ${estate['closetime']}',
              mobileNo: estate['mobileNo'] ?? '', // Use mobileNo from Firestore
              isFavorite: false,
              onFavoriteToggle: () {
                // Implement favorite toggle logic if needed
              },
            );
          },
        ),
      ),
    );
  }
}

class EstateCard extends StatelessWidget {
  final String estateName;
  final String location;
  final String distance;
  final String availableUntil;
  final String mobileNo;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const EstateCard({
    required this.estateName,
    required this.location,
    required this.distance,
    required this.availableUntil,
    required this.mobileNo,
    required this.isFavorite,
    required this.onFavoriteToggle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey.shade200,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: Colors.orangeAccent.withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color: Colors.orangeAccent.withOpacity(0.7),
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/26.png'), // Placeholder image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  estateName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.deepPurple,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              GestureDetector(
                                onTap: onFavoriteToggle,
                                child: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 18, color: Colors.grey),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  '$location - $distance',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            availableUntil,
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final Uri callUri = Uri(scheme: 'tel', path: mobileNo);
                          if (await canLaunchUrl(callUri)) {
                            await launchUrl(callUri);
                          } else {
                            print("Could not launch dialer");
                          }
                        },
                        icon: const Icon(Icons.call, size: 18, color: Colors.orange),
                        label: const Text('Call Now', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final Uri whatsappUri = Uri.parse('https://wa.me/$mobileNo');
                          if (await canLaunchUrl(whatsappUri)) {
                            await launchUrl(whatsappUri);
                          } else {
                            print("Could not launch WhatsApp");
                          }
                        },
                        icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18, color: Colors.lightGreenAccent),
                        label: const Text('Ct', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreenAccent)),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}