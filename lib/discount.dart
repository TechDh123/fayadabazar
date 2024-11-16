import 'package:flutter/material.dart';

class Hotelsdiscounts extends StatefulWidget {
  const Hotelsdiscounts({super.key});

  @override
  _HotelsdiscountsState createState() => _HotelsdiscountsState();
}

class _HotelsdiscountsState extends State<Hotelsdiscounts> {
  final List<bool> isFavoriteList = List.generate(16, (index) => false);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of columns based on orientation and screen width
    final crossAxisCount = orientation == Orientation.portrait
        ? (screenWidth > 600 ? 2 : 2)
        : (screenWidth > 900 ? 3 : 3);

    final crossAxisSpacing = 10.0;
    final mainAxisSpacing = 20.0;

    // Calculate image size
    final imageSize = (screenWidth / crossAxisCount) - (crossAxisSpacing * 1.5);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discount Restaurants'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 16,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: imageSize,
                    height: imageSize * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/26.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 2,
                    child: IconButton(
                      icon: Icon(
                        isFavoriteList[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavoriteList[index] ? Colors.red : Colors.yellowAccent,
                        size: 24,
                      ),
                      onPressed: () {
                        // Toggle favorite state
                        setState(() {
                          isFavoriteList[index] = !isFavoriteList[index];
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Hotels and Restaurants",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text("4.7"),
                  SizedBox(width: 5),
                  Icon(
                    Icons.location_on_rounded,
                    size: 17,
                  ),
                  SizedBox(width: 5),
                  Text("Chandkheda"),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
