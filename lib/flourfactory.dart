import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FlourFactory extends StatefulWidget {
  const FlourFactory({super.key});

  @override
  State<FlourFactory> createState() => _FlourFactoryState();
}

class _FlourFactoryState extends State<FlourFactory> {
  // Dummy search filter options
  String selectedFilter = "All";

  // TextEditingController for search field
  final TextEditingController _searchController = TextEditingController();
  final CarouselSliderController carouselController =
  CarouselSliderController();
  int currentIndex = 0;
  List<Map<String, String>> imageList = [
    {"id": "1", "image_path": 'assets/images/businesscategory/flourfactory/flour1.png'},
    {"id": "1", "image_path": 'assets/images/businesscategory/flourfactory/flour2.png'},
    {"id": "1", "image_path": 'assets/images/businesscategory/flourfactory/flour3.png'},
    {"id": "1", "image_path": 'assets/images/businesscategory/flourfactory/flour4.png'},
    {"id": "1", "image_path": 'assets/images/businesscategory/flourfactory/flour5.png'},
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // To disable default back button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(child: Icon(Icons.near_me, color: Colors.orange, size: 22)),
            SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main Location Label
                Row(
                  children: [
                    Center(
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
                  ],
                ),
                // Sub Location Label
                Center(
                  child: Text(
                    'Ahmedabad',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60), // Adjust height for search bar
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Light grey background for search bar
                borderRadius: BorderRadius.circular(30.0), // Rounded edges
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.search, color: Colors.black54),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for available flour factory, or more',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children:  [
              SizedBox(height: 20),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
                    final screenSize = MediaQuery.of(context).size;


                    double containerHeight = isLandscape
                        ? screenSize.height * 1.1
                        : screenSize.height * 0.27;

                    return Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(0.0),
                      width: screenSize.width * 0.9,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 9,
                            blurRadius: 7,

                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Carousel Slider
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CarouselSlider(
                              items: imageList
                                  .map(
                                    (item) => Container(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight,
                                  child: Image.asset(
                                    item['image_path']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                                  .toList(),
                              carouselController: carouselController,
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1.0,
                                enlargeCenterPage: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                          // Position the indicator dots
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imageList.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => carouselController.jumpToPage(entry.key),
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == entry.key
                                          ? Colors.orange
                                          : Colors.grey,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text("Get your  flour factories",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "TImes New Roman"),),
                  Spacer(),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "SEE ALL",
                        style: TextStyle(color: Colors.orange, fontSize: 14,fontFamily: "Times Nmew Roman",fontWeight: FontWeight.bold),
                      ),
                    ),

                  ),
                ],
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    topCategoriesImages.length,
                        (index) {
                      final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
                      final screenSize = MediaQuery.of(context).size;

                      double containerWidth = isLandscape ? screenSize.width * 0.6 : screenSize.width * 0.8;
                      double containerHeight = isLandscape ? screenSize.height * 0.4 : screenSize.height * 0.3;

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: containerWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image container
                            Container(
                              width: containerWidth,
                              height: containerHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey, width: 2),
                                image: DecorationImage(
                                  image: AssetImage(specialoffrecesImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Hotel details
                            Container(
                              width: containerWidth,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                border: Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Flour factory Name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      // Star Rating
                                      Row(
                                        children: List.generate(
                                          5, // 4 full stars and 1 half star
                                              (starIndex) => Icon(
                                            starIndex < 4 ? Icons.star : Icons.star_half, // 4.2 rating
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      // Distance
                                      const Text(
                                        '6.4 km',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      // Cuisine
                                      const Text('Pinoneer flour mills',style: TextStyle(color: Colors.black,fontSize: 14),),

                                      const Spacer(),
                                      // Price for two
                                      const Text(
                                        'Rs. 1300 for two',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),


              const SizedBox(height: 10),

              Row(
                children: const [
                  SizedBox(width: 20),
                  Text(
                    "Your Finest Flour factories",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Times New Roman",
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    topCategoriesImages.length,
                        (index) {
                      final isLandscape =
                          MediaQuery.of(context).orientation == Orientation.landscape;
                      final screenSize = MediaQuery.of(context).size;

                      double containerWidth = isLandscape
                          ? screenSize.width * 0.3
                          : screenSize.width * 0.4;

                      double containerHeight = isLandscape
                          ? screenSize.height * 0.3
                          : screenSize.height * 0.2;

                      List<String> topCategoriesText = [
                        'Top Rated',
                        'Newly Added',
                        'City Favourites',
                      ];

                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: containerWidth,
                            height: containerHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 2),
                              image: DecorationImage(
                                image: AssetImage(topCategoriesImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.01),
                          Text(
                            topCategoriesText[index],
                            style: TextStyle(
                              fontSize: isLandscape ? 14 : 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Explore 1000 of more Flour factories all over India",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: List.generate(
                  topCategoriesImages.length,
                      (index) {
                    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
                    final screenSize = MediaQuery.of(context).size;

                    double containerWidth = isLandscape ? screenSize.width * 0.9 : screenSize.width * 0.9;
                    double containerHeight = isLandscape ? screenSize.height * 0.4 : screenSize.height * 0.3;

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: containerWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image container
                          Container(
                            width: containerWidth,
                            height: containerHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 2),
                              image: DecorationImage(
                                image: AssetImage(specialoffrecesImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Hotel details
                          Container(
                            width: containerWidth,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Flour Factory Name',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    // Star Rating
                                    Row(
                                      children: List.generate(
                                        5,
                                            (starIndex) => Icon(
                                          starIndex < 4 ? Icons.star : Icons.star_half,
                                          color: Colors.yellow,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    // Distance
                                    const Text(
                                      '6.4 km',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    // Cuisine
                                    const Text(
                                      'Asian, North Plaza',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Spacer(),
                                    // Price for two
                                    const Text(
                                      'Rs. 1300 for two',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
List<String> specialoffrecesImages = [
  'assets/images/businesscategory/flourfactory/flour6.png',
  'assets/images/businesscategory/flourfactory/flour7.png',
  'assets/images/businesscategory/flourfactory/flour8.png',
  'assets/images/businesscategory/flourfactory/flour1.png',
  'assets/images/businesscategory/flourfactory/flour1.png',
  'assets/images/businesscategory/flourfactory/flour1.png',
];

List<String> topCategoriesImages = [
  'assets/images/businesscategory/flourfactory/flour3.png',
  'assets/images/businesscategory/flourfactory/flour4.png',
  'assets/images/businesscategory/flourfactory/flour5.png',
];

int hexColor(String colorHexCode) {
  String colorNew = '0xff' + colorHexCode.replaceAll('#', '');
  int colorInt = int.parse(colorNew);
  return colorInt;
}