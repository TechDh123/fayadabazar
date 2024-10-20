import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({super.key});

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  // List of all categories
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.phone_android, 'label': 'Mobile Recharge', 'isCircular': true},
    {'icon': Icons.receipt_long, 'label': 'Bill Payment', 'isCircular': true},
    {'icon': Icons.send, 'label': 'Money Transfer', 'isCircular': true},
    {'icon': Icons.tv, 'label': 'DTH Recharge', 'isCircular': true},
    {'icon': Icons.local_gas_station, 'label': 'Gas Bill', 'isCircular': true},
    {'icon': Icons.water, 'label': 'Water Bill', 'isCircular': true},
  ];

  List<Map<String, dynamic>> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    // Initialize filtered categories with all categories
    filteredCategories = List.from(categories);
  }

  void _filterCategories(String query) {
    final filtered = categories.where((category) {
      final labelLower = category['label'].toLowerCase();
      final queryLower = query.toLowerCase();
      return labelLower.contains(queryLower);
    }).toList();

    setState(() {
      filteredCategories = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Bill Payments & Recharges",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: _filterCategories,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),

              // Promotional Image
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                shadowColor: Colors.grey.withOpacity(0.2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/1.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: size.height * 0.2,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Categories Section
              Text(
                "Categories",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: filteredCategories.map((category) {
                  return _buildIcon(
                    category['icon'],
                    category['label'],
                    isCircular: category['isCircular'],
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              // Recommended Section
              Text(
                "Recommended",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  _buildIcon(Icons.electric_bolt, 'Electricity', isCircular: false),
                  _buildIcon(Icons.phone_android, 'Mobile Recharge', isCircular: false),
                  _buildIcon(Icons.local_gas_station, 'Gas Bill', isCircular: false),
                  _buildIcon(Icons.tv, 'DTH Recharge', isCircular: false),
                ],
              ),
              const SizedBox(height: 30),

              // Home Bills Section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                shadowColor: Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section Title
                      Text(
                        "Home Bills",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Horizontal List of Home Bills Icons
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildIcon(Icons.electric_meter, 'Electricity Bill', isCircular: false, size: 30.0),
                            const SizedBox(width: 20),
                            _buildIcon(Icons.mobile_friendly_outlined, 'Post Paid', isCircular: false),
                            const SizedBox(width: 20),
                            _buildIcon(Icons.sd_card, 'Datacard', isCircular: false),
                            const SizedBox(width: 20),
                            _buildIcon(Icons.local_phone, 'Landline', isCircular: false),
                            const SizedBox(width: 20),
                            _buildIcon(Icons.water_outlined, 'Water Bill', isCircular: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Insurance & Loan EMI Section
                      Text(
                        "Insurance & Loan EMI",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // First Row with 3 Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child: _buildIcon(Icons.safety_check_rounded,'Insurance', isCircular: false)),
                          const SizedBox(width: 10),
                          Expanded(child: _buildIcon(Icons.home_repair_service, 'Loan EMI', isCircular: false)),

                    ],
                  ),
                ]),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build icon with label
  Widget _buildIcon(IconData icon, String label, {bool isCircular = false, double size = 30.0}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon Container
        Container(
          width: isCircular ? 60 : 70,
          height: isCircular ? 60 : 70,
          decoration: BoxDecoration(
            color: isCircular ? Colors.blueAccent : Colors.white,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircular ? null : BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: isCircular ? Colors.white : Colors.blueAccent,
            size: size,
          ),
        ),
        const SizedBox(height: 8),
        // Label
        SizedBox(
          width: 90,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
