import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Exploreestates extends StatefulWidget {
  const Exploreestates({super.key});

  @override
  State<Exploreestates> createState() => _ExploreestatesState();
}

class _ExploreestatesState extends State<Exploreestates> {
  List<bool> favoriteStates = [true, false, false, false, false]; // Track favorite states

  void toggleFavorite(int index) {
    setState(() {
      favoriteStates[index] = !favoriteStates[index];
    });
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            EstateCard(
              estateName: 'Wings Tower',
              location: 'Jakarta, India',
              distance: '12.1 km',
              availableUntil: '7:00 pm',
              isFavorite: favoriteStates[0],
              onFavoriteToggle: () => toggleFavorite(0),
            ),
            EstateCard(
              estateName: 'Roman Wings',
              location: 'Jakarta, India',
              distance: '12.1 km',
              availableUntil: '7:00 pm',
              isFavorite: favoriteStates[1],
              onFavoriteToggle: () => toggleFavorite(1),
            ),
            EstateCard(
              estateName: 'Roman Wings',
              location: 'Jakarta, India',
              distance: '11.1 km',
              availableUntil: '7:00 pm',
              isFavorite: favoriteStates[2],
              onFavoriteToggle: () => toggleFavorite(2),
            ),
            EstateCard(
              estateName: 'Roman Wings',
              location: 'Jakarta, India',
              distance: '11.1 km',
              availableUntil: '7:00 pm',
              isFavorite: favoriteStates[3],
              onFavoriteToggle: () => toggleFavorite(3),
            ),
            EstateCard(
              estateName: 'Roman Wings',
              location: 'Jakarta, India',
              distance: '11.1 km',
              availableUntil: '7:00 pm',
              isFavorite: favoriteStates[4],
              onFavoriteToggle: () => toggleFavorite(4),
            ),
          ],
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
  final bool isFavorite;
  final VoidCallback onFavoriteToggle; // Add this

  const EstateCard({
    required this.estateName,
    required this.location,
    required this.distance,
    required this.availableUntil,
    required this.isFavorite,
    required this.onFavoriteToggle, // Add this
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
                    // Image Container with solid border
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
                    // Estate Info
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
                                onTap: onFavoriteToggle, // Add the onTap callback
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
                            'Available Until $availableUntil',
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
                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Call Now button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
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
                    // Chat button
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18, color: Colors.lightGreenAccent),
                        label: const Text('Chat', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreenAccent)),
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
