import 'package:faydabazar/BillPayment.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TextEditingController _searchController = TextEditingController();
  List<CategoryIconData> _filteredIcons = List.from(_categoryIcons);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterIcons);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterIcons);
    _searchController.dispose();
    super.dispose();
  }

  void _filterIcons() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredIcons = _categoryIcons.where((iconData) {
        return iconData.label.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size and orientation
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;

    // Define common styles
    TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: isPortrait ? 30 : 36,
    );

    TextStyle headerStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: isPortrait ? 20 : 24,
    );

    // Define spacing
    double verticalSpacing = isPortrait ? 30 : 20;
    double paddingValue = isPortrait ? 16.0 : 24.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Fayda',
                style: titleStyle.copyWith(color: Colors.orange),
              ),
              TextSpan(
                text: 'bazar',
                style: titleStyle.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(paddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.blue),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: verticalSpacing),
              Text(
                "Popular Services",
                style: headerStyle,
              ),
              SizedBox(height: 10),
              // Use GridView for 3 icons per row
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 icons per row
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: _filteredIcons.length,
                itemBuilder: (context, index) {
                  final item = _filteredIcons[index];
                  if (item.label == 'Bill Payment') {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillPayment(),
                          ),
                        );
                      },
                      child: CategoryIcon(
                        icon: item.icon,
                        label: item.label,
                      ),
                    );
                  }

                  return CategoryIcon(
                    icon: item.icon,
                    label: item.label,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define a list of category icons including new ones
final List<CategoryIconData> _categoryIcons = [
  CategoryIconData(icon: Icons.local_cafe, label: 'Cafe'),
  CategoryIconData(icon: Icons.remove_red_eye_rounded, label: 'Eye Optical'),
  CategoryIconData(icon: Icons.fastfood, label: 'Fast Food'),
  CategoryIconData(icon: Icons.spa_rounded, label: 'Spa Parlour'),
  CategoryIconData(icon: Icons.flight, label: 'Flights Tickets'),
  CategoryIconData(icon: Icons.bus_alert, label: 'Bus Tickets'),
  CategoryIconData(icon: Icons.train, label: 'Train Tickets'),
  CategoryIconData(icon: Icons.movie, label: 'Movie tickets'),
  CategoryIconData(icon: Icons.event, label: 'Event tickets'),
  //
  CategoryIconData(icon: Icons.train_rounded, label: 'Metro tickets'),
  CategoryIconData(icon: Icons.local_grocery_store, label: 'Grocery Store'),
  CategoryIconData(icon: Icons.soup_kitchen, label: 'Caterers'),
  CategoryIconData(icon: Icons.electrical_services, label: 'Electronic Service'),
  CategoryIconData(icon: Icons.local_laundry_service, label: 'Laundry'),
  CategoryIconData(icon: Icons.medical_services, label: 'Doctor'),
  CategoryIconData(icon: Icons.travel_explore, label: 'Tours & Travels'),
  CategoryIconData(icon: Icons.room_preferences, label: 'Hostel'),
  CategoryIconData(icon: Icons.drag_indicator, label: 'Driving School'),
  CategoryIconData(icon: Icons.cleaning_services, label: 'Dry Cleaning'),
  CategoryIconData(icon: Icons.child_care, label: 'Kids Wear'),
  CategoryIconData(icon: Icons.church_outlined, label: 'panditji'),
  CategoryIconData(icon: Icons.money_rounded, label: 'Bill Payment'),
  CategoryIconData(icon: Icons.medication_liquid, label: 'laboratory'),
  CategoryIconData(icon: Icons.chair, label: 'Furniture'),
  CategoryIconData(icon: Icons.cake, label: 'Sweet Mart'),
  CategoryIconData(icon: Icons.house, label: 'Housekeeping'),
  CategoryIconData(icon: Icons.bakery_dining, label: 'Bakery'),

  CategoryIconData(icon: Icons.woman_outlined, label: 'Women Wear'),
  CategoryIconData(icon: Icons.male, label: 'Men Accessories'),
  CategoryIconData(icon: Icons.cut_rounded, label: 'Hair Salon'),
  CategoryIconData(icon: Icons.phone_iphone, label: 'Mobile Accessories'),
  CategoryIconData(icon: Icons.medical_services, label: 'Medical Store'),
  CategoryIconData(icon: Icons.edit, label: 'Stationary'),
  CategoryIconData(icon: Icons.developer_mode, label: 'Decorator'),
  CategoryIconData(icon: Icons.hardware, label: 'Hardware'),
  CategoryIconData(icon: Icons.kitchen, label: 'Crockery Shop'),
  CategoryIconData(icon: Icons.agriculture, label: 'Agriculture'),
  CategoryIconData(icon: Icons.school, label: 'Education'),
  CategoryIconData(icon: Icons.local_florist, label: 'Flowers'),
  CategoryIconData(icon: Icons.emoji_nature, label: 'Vegetables'),
  CategoryIconData(icon: Icons.apple, label: 'Fruits'),
  CategoryIconData(icon: Icons.sailing_rounded, label: 'Insurance'),
  CategoryIconData(icon: Icons.baby_changing_station, label: 'Baby Care'),
  CategoryIconData(icon: Icons.book, label: 'Book Store'),
  CategoryIconData(icon: Icons.computer, label: 'Computer'),
  CategoryIconData(icon: Icons.star, label: 'Astrologer'),
  CategoryIconData(icon: Icons.temple_hindu, label: 'Temple'),
  CategoryIconData(icon: Icons.security, label: 'Security'),
  CategoryIconData(icon: Icons.build, label: 'Building Material'),
  CategoryIconData(icon: Icons.plumbing, label: 'Plastic Material'),
  CategoryIconData(icon: Icons.liquor_rounded, label: 'Dairy & Milk Products'),
  CategoryIconData(icon: Icons.charging_station, label: 'EV Charging'),
  CategoryIconData(icon: Icons.comment_bank, label: 'Bank'),
  CategoryIconData(icon: Icons.icecream_rounded, label: 'Ice Cream Parlour'),
];

// Data class for category icon
class CategoryIconData {
  final IconData icon;
  final String label;

  CategoryIconData({required this.icon, required this.label});
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryIcon({super.key, required this.icon, required this.label});


    @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40.0,
          color: Colors.blue,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
