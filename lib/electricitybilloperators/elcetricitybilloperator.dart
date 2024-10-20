import 'package:flutter/material.dart';

import 'apsdclandhrapradeshinsertion.dart';

class ElectricityBillOperator extends StatefulWidget {
  const ElectricityBillOperator({super.key});

  @override
  State<ElectricityBillOperator> createState() => _ElectricityBillOperatorState();
}

class _ElectricityBillOperatorState extends State<ElectricityBillOperator> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _operators = [
    "APSPDCL - ANDHRA PRADESH",
    "UPPCL (RURAL) - UTTAR PRADESH",
    "TPADL - AJMER",
    "APDCL (RAPDR) - ASSAM",
    "NBPDCL - North Bihar Electricity",
    "WESCO - ODISHA",
    "MSEDCL - MAHARASHTRA",
    "CSPDCL - Chhattisgarh State Power Distribution Company",
    "Adani Electricity - MUMBAI",
    "APDCL (Non-RAPDR) - ASSAM",
    "Madhya Kshetra Vitaran (Urban) - MADHYA PRADESH",
    "MEPDCL - MEGHALAYA",
    "SOUTHCO - ODISHA",
    "WBSEDCL - WEST BENGAL",
    "DNHPDCL - DADRA & NAGAR HAVELI",
    "Madhya Kshetra Vitaran (Rural) - MADHYA PRADESH",
    "SBPDCL - South Bihar Electricity",
    "JBVNL - JHARKHAND",
    "TSECL - Tripura State Electricity Corporation",
    "DHBVN - Dakshin Haryana Bijli Vitran Nigam",
    "Ajmer Vidyut Vitran Nigam - RAJASTHAN",
    "HESCOM - KARNATAKA",
    "TORRENT POWER",
    "GESCOM - KARNATAKA",
    "BKESL - BIKANER",
    "BSES Yamuna Power Ltd - Delhi",
    "KESCO - KANPUR",
    "PGVCL - PASCHIM GUJARAT VIJ COMPANY",
    "Tata Power - DELHI",
    "BEST Undertaking - MUMBAI",
    "CESC - WEST BENGAL",
    "Kota Electricity Distribution - RAJASTHAN",
    "Paschim Kshetra Vitaran - MADHYA PRADESH",
    "Noida Power Company Limited",
    "Tata Power - MUMBAI",
    "UHBVN - Uttar Haryana Bijli Vitran Nigam",
    "TNEB - TAMIL NADU",
    "UGVCL - UTTAR GUJARAT VIJ COMPANY",
    "Poorv Kshetra Vitaran (Rural) - MADHYA PRADESH",
    "BSES Rajdhani Power Ltd - Delhi",
    "Jaipur Vidyut Vitran Nigam - RAJASTHAN",
    "MGVCL - MADHYA GUJARAT VIJ COMPANY",
    "Himachal Pradesh State Electricity Board",
    "BESL - BHARATPUR",
    "PSPCL - Punjab State Power Corporation Limited",
    "BESCOM - BENGALURU",
    "Sikkim Power (Rural)",
    "Poorv Kshetra Vitaran (Urban) - MADHYA PRADESH",
    "UPCL - UTTARAKHAND",
    "Daman and Diu Electricity",
    "APEPDCL - ANDHRA PRADESH",
    "Jodhpur Vidyut Vitran Nigam - RAJASTHAN",
    "NDMC - DELHI",
    "NESCO - ODISHA",
    "JUSCO - Jamshedpur Utilities & Services Company Ltd",
    "DGVCL - DAKSHIN GUJARAT VIJ COMPANY",
    "UPPCL (URBAN) - UTTAR PRADESH",
    "CESCOM - KARNATAKA",
    "India Power - WEST BENGAL",
    "India Power - BIHAR",
    "SNDL Power - NAGPUR",
    "Muzaffarpur Vidyut Vitran",
    "Reliance Energy Limited",
  ];
  List<String> _filteredOperators = [];

  @override
  void initState() {
    super.initState();
    _filteredOperators = _operators;
  }

  void _filterOperators(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredOperators = _operators;
      } else {
        _filteredOperators = _operators
            .where((operator) => operator.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.orangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.deepPurpleAccent,
        title: Text("Electricity Bill Operator", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Times New Roman")),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueGrey[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterOperators,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                    labelText: 'Search Operator',
                    labelStyle: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: _filteredOperators.map((operator) {
                  return _buildOperatorCard(operator);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOperatorCard(String label) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(Icons.electrical_services, color: Colors.deepPurple),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.deepPurple,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          // Navigate to the second page with the selected operator name
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => APSDCLAndhraPradeshInsertion(operatorName: label),
            ),
          );
        },
      ),
    );
  }
}
