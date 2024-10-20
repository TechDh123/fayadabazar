import 'package:flutter/material.dart';

class FetchPlanPage extends StatefulWidget {
  const FetchPlanPage({super.key});

  @override
  State<FetchPlanPage> createState() => _FetchPlanPageState();
}

class _FetchPlanPageState extends State<FetchPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("Fetch Plan",style: TextStyle(fontFamily: 'Times New Roman',fontWeight: FontWeight.bold),)
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab(context, 'All', isSelected: true),
                _buildTab(context, '121 made for you'),
                _buildTab(context, 'FullTT'),
              ],
            ),
            SizedBox(height: 16),

            // Pricing Cards
            ListView(
              shrinkWrap: true, // Prevents the ListView from taking infinite height
              physics: NeverScrollableScrollPhysics(), // Disable scrolling of ListView
              children: [
                _buildPricingCard(context, '₹ 239 | 28 days', '2 GB / Day | Unlimited calling | 3000 SMS'),
                SizedBox(height: 16),
                _buildPricingCard(context, '₹ 199 | 28 days', '1.5 GB / Day | Unlimited calling | 3000 SMS'),
                SizedBox(height: 16),
                _buildPricingCard(context, '₹ 719 | 84 days', '2 GB / Day | Unlimited calling | 3000 SMS'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPricingCard(BuildContext context, String price, String details) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text(
                details,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.limeAccent, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('BUY',style: TextStyle(fontWeight: FontWeight.bold,backgroundColor: Colors.white24),),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
