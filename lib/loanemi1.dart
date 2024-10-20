import 'package:flutter/material.dart';

class LoanEMICalculatorPage extends StatefulWidget {
  @override
  _LoanEMICalculatorPageState createState() => _LoanEMICalculatorPageState();
}

class _LoanEMICalculatorPageState extends State<LoanEMICalculatorPage> {

  String? selectedBank;

  final List<Map<String, String>> banks = [
    {"value": "0", "name": "Select Operator"},
    {"value": "278", "name": "Diwakar Tracom Private Limited"},
    {"value": "279", "name": "Hindon Mercantile Limited - Mufin"},
    {"value": "280", "name": "Indostar Home Finance Private Limited"},
    {"value": "281", "name": "Loan2Wheels"},
    {"value": "282", "name": "Muthoot Money"},
    {"value": "283", "name": "Rupee Circle"},
    {"value": "284", "name": "HDB Financial Services Limited"},
    {"value": "296", "name": "DCBS Loan"},
    {"value": "297", "name": "Reliance ARC"},
    {"value": "298", "name": "Muthoot Homefin Limited"},
    {"value": "299", "name": "Electronica Finance Limited"},
    {"value": "241", "name": "IIFL Home Finance"},
    {"value": "188", "name": "Toyota Financial Services"},
    {"value": "230", "name": "INDUSIND BANK - CFD"},
    {"value": "231", "name": "Kinara Capital"},
    {"value": "240", "name": "MoneyTap"},
    {"value": "243", "name": "IIFL Finance Limited"},
    {"value": "239", "name": "Clix"},
    {"value": "205", "name": "Home First Finance Company India Limited"},
    {"value": "291", "name": "RMK Fincorp Pvt Ltd"},
    {"value": "292", "name": "Asirvad Micro Finance Ltd"},
    {"value": "293", "name": "SMILE Microfinance Limited"},
    {"value": "294", "name": "LIC Housing Finance Limited"},
    {"value": "295", "name": "Pahal Financial Services Pvt Ltd"},
    {"value": "232", "name": "Annapurna Finance Private Limited-MFI"},
    {"value": "167", "name": "Paisa Dukan"},
    {"value": "255", "name": "Kotak Mahindra Bank Ltd.-Loans"},
    {"value": "168", "name": "Snapmint"},
    {"value": "256", "name": "Samasta Microfinance Limited"},
    {"value": "257", "name": "Indiabulls Commercial Credit Ltd"},
    {"value": "258", "name": "Novelty Finance Ltd"},
    {"value": "259", "name": "Thazhayil Nidhi Ltd"},
    {"value": "260", "name": "Aptus Value Housing Finance India Limited"},
    {"value": "261", "name": "Mitron Capital"},
    {"value": "262", "name": "Aptus Finance India Private Limited"},
    {"value": "272", "name": "Ayaan Finserve India Private LTD"},
    {"value": "215", "name": "FlexiLoans"},
    {"value": "165", "name": "LokSuvidha"},
    {"value": "209", "name": "ZestMoney"},
    {"value": "210", "name": "OMLP2P.COM"},
    {"value": "216", "name": "Annapurna Finance Private Limited-MSME"},
    {"value": "215", "name": "FlexiLoans"},
    {"value": "247", "name": "Bharat Financial Inclusion Ltd"},
    {"value": "248", "name": "Orange Retail Finance India Pvt Ltd"},
    {"value": "249", "name": "Pooja Finelease"},
    {"value": "250", "name": "Vistaar Financial services Private Limited"},
    {"value": "251", "name": "Axis Bank Limited-Microfinance"},
    {"value": "252", "name": "InCred"},
    {"value": "253", "name": "Netafim Agricultural Financing Agency Pvt. Ltd."},
    {"value": "254", "name": "Kotak Mahindra Prime Limited"},
    {"value": "203", "name": "Fullerton India credit company limited"},
    {"value": "204", "name": "NM Finance"},
    {"value": "197", "name": "Kanakadurga Finance Limited"},
    {"value": "198", "name": "Mahindra Home Finance"},
    {"value": "199", "name": "Nidhilakshmi Finance"},
    {"value": "217", "name": "Fullerton India Housing Finance Limited"},
    {"value": "164", "name": "L&T Financial Services"},
    {"value": "218", "name": "Manappuram Finance Limited-Vehicle Loan"},
    {"value": "212", "name": "Eduvanz Financing Pvt. Ltd."},
    {"value": "163", "name": "IDFC FIRST Bank"},
    {"value": "236", "name": "Svatantra Microfin Private Limited"},
    {"value": "244", "name": "CreditAccess Grameen - Microfinance"},
    {"value": "245", "name": "CreditAccess Grameen - Retail Finance"},
    {"value": "246", "name": "TVS Credit"},
    {"value": "314", "name": "Kanakadurga Finance Limited - Gold Loans"},
    {"value": "315", "name": "KREDITBEE"},
    {"value": "316", "name": "STREE NIDHI - TELANGANA"},
    {"value": "222", "name": "India Shelter Finance Corporation Limited"},
    {"value": "184", "name": "Midland Microfin Ltd"},
    {"value": "185", "name": "Ujjivan Small Finance Bank"},
    {"value": "179", "name": "Shriram Housing Finance Limited"},
    {"value": "177", "name": "Ess Kay Fincorp Limited"},
    {"value": "178", "name": "Kissht"},
    {"value": "190", "name": "Aditya Birla Housing Finance Limited"},
    {"value": "191", "name": "India Home Loan Limited"},
    {"value": "269", "name": "Rander Peoples Co Operative Bank Ltd"},
    {"value": "270", "name": "Aditya Birla Finance Limited"},
    {"value": "271", "name": "Finova Capital Private Ltd"},
    {"value": "262", "name": "Aptus Finance India Private Limited"},
    {"value": "272", "name": "Ayaan Finserve India Private LTD"},
    {"value": "273", "name": "Sarvjan India Fintech Private Limited"},
    {"value": "274", "name": "Aadhar Housing Finance Limited"},
    {"value": "275", "name": "IDF Financial Services Private Limited"},
    {"value": "276", "name": "Equitas SFB - Microfinance Loan"},
    {"value": "171", "name": "Avanse Financial Services Ltd"},
    {"value": "172", "name": "Shriram City Union Finance Ltd"},
    {"value": "186", "name": "Faircent-Borrower EMI Account"},
    {"value": "187", "name": "Mintifi Finserve Private Limited"},
    {"value": "196", "name": "Arohan Financial Services Ltd"},
    {"value": "208", "name": "Varthana"},
    {"value": "173", "name": "Capri Global Housing Finance"},
    {"value": "174", "name": "Cars24 Financial Services Private Limited"},
    {"value": "263", "name": "X10 Financial Services Limited"},
    {"value": "264", "name": "Agora Microfinance India Ltd - AMIL"},
    {"value": "215", "name": "FlexiLoans"},
    {"value": "265", "name": "Muthoot Housing Finance Company Limited"},
    {"value": "266", "name": "Mahindra and Mahindra Financial Services Limited"},
    {"value": "267", "name": "ESAF Small Finance Bank (Micro Loans)"},
    {"value": "268", "name": "Yogakshemam Loans Ltd"},
    {"value": "219", "name": "Chaitanya India Fin Credit Pvt Ltd"},
    {"value": "207", "name": "Maxvalue Credits And Investments Ltd"},
    {"value": "227", "name": "Indiabulls Consumer Finance Limited"},
    {"value": "228", "name": "Indiabulls Housing Finance Limited"},
    {"value": "229", "name": "Jain Autofin"},
    {"value": "213", "name": "Capri Global Capital Limited"},
    {"value": "214", "name": "ICICI Bank Ltd - Loans"},
    {"value": "300", "name": "Moneywise Financial Services Private Limited"},
    {"value": "301", "name": "Suryoday Small Finance Bank"},
    {"value": "302", "name": "Spandana Rural And Urban Development Organisation"},
    {"value": "303", "name": "Care India Finvest Limited"},
    {"value": "304", "name": "TATA Capital Financial Services Ltd"},
    {"value": "305", "name": "Mahindra Rural Housing Finance Ltd"},
    {"value": "306", "name": "Bajaj Finance Limited"},
    {"value": "307", "name": "Go Digit General Insurance"},
    {"value": "308", "name": "Proficient Financial Services Private Limited"},
    {"value": "309", "name": "Jana Small Finance Bank"},
    {"value": "310", "name": "Madhavbaug Health Care Pvt Ltd"},
    {"value": "311", "name": "Poonawalla Fincorp Limited"},
    {"value": "312", "name": "Fusion Microfinance Pvt Ltd"},
    {"value": "313", "name": "Aditya Birla Capital Limited"},
    {"value": "317", "name": "Incred"},
    {"value": "318", "name": "Poonawalla Fincorp Ltd"},
    {"value": "319", "name": "Equitas Small Finance Bank"},
    {"value": "320", "name": "Ujjivan Small Finance Bank"},
    {"value": "321", "name": "Kotak Mahindra Bank"},
    {"value": "322", "name": "HDFC Bank"},
    {"value": "323", "name": "ICICI Bank"},
    {"value": "324", "name": "State Bank of India"},
    {"value": "325", "name": "Axis Bank"},
    {"value": "326", "name": "Punjab National Bank"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Loan EMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isPortrait = constraints.maxWidth < constraints.maxHeight;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 20),
                  _inputField(
                    label: 'Select The Bank',
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Amount",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                contentPadding: EdgeInsets.only(
                                    right: 80), // Space for button
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            Positioned(
                              right: 5,
                              child: OutlinedButton(
                                onPressed: () {
                                  // Logic for "Get Info"
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                  side: BorderSide(
                                      color: Colors.blue.shade900,
                                      width: 1),
                                ),
                                child: Text(
                                  "Get Info",
                                  style: TextStyle(fontSize: 14,color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.teal, Colors.green],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Calculate EMI Logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: isPortrait ? 20 : 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _loanTypeButton(String text, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Handle button press
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.teal.shade100 : Colors.grey.shade200,
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.teal.withOpacity(0.5),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
          ],
        ),
        padding: EdgeInsets.all(10),
        width: 100,
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.teal : Colors.grey,
              size: 30,
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.teal : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required String label,
    String? hintText,
    String? suffixText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 2), // Black border
            color: Colors.grey.shade100,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedBank,
              hint: Text(hintText ?? ''),
              items: banks.map((bank) {
                return DropdownMenuItem<String>(
                  value: bank["value"],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(bank["name"]!),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedBank = newValue;
                });
              },
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(Icons.arrow_drop_down, color: Colors.teal),
              ),
            ),
          ),
        ),
      ],
    );
  }


  }
