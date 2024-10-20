import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class KYCDocuments extends StatefulWidget {
  const KYCDocuments({super.key});

  @override
  State<KYCDocuments> createState() => _KYCDocumentsState();
}

class _KYCDocumentsState extends State<KYCDocuments> {
  final List<String> documentNames = [
    'PAN Card',
    'Voter ID',
    'Aadhaar Card',
    'Aadhaar Card (Back)',
    'Driving License',
    'Bank Passbook'
  ];

  List<String> selectedFiles = List.generate(6, (index) => 'No file chosen');

  Future<void> _pickFile(int index) async {
    // Allow user to pick image or PDF file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFiles[index] = result.files.first.name; // Get the name of the selected file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Fayda',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                  fontSize: _getTitleFontSize(screenWidth),
                ),
              ),
              TextSpan(
                text: 'bazar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: _getTitleFontSize(screenWidth),
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.dashboard, color: Colors.orange),
          onPressed: () {},
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
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'KYC Documents',
                style: TextStyle(
                  fontSize: _getTitleFontSize(screenWidth) * 1.2,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Card(
              elevation: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20,
                  border: TableBorder(
                    horizontalInside: BorderSide(color: Colors.grey, width: 1),
                    verticalInside: BorderSide(color: Colors.grey, width: 1),
                    bottom: BorderSide(color: Colors.grey, width: 1),
                  ),
                  columns: const [
                    DataColumn(label: Text('S.No')),
                    DataColumn(label: Text('Document Name')),
                    DataColumn(label: Text('Upload Document')),
                    DataColumn(label: Text('Enter Remark')),
                    DataColumn(label: Text('Verification Status')),
                  ],
                  rows: List<DataRow>.generate(
                    documentNames.length,
                        (index) => DataRow(
                      cells: [
                        _buildDataCell(Text('${index + 1}')),
                        _buildDataCell(Text(documentNames[index])),
                        _buildDataCell(
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () => _pickFile(index),
                                child: const Text(
                                  'Choose File',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(selectedFiles[index]),
                            ],
                          ),
                        ),
                        _buildDataCell(
                          SizedBox(
                            width: screenWidth * 0.5,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter remark',
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                        _buildDataCell(
                          SizedBox(
                            width: screenWidth * 0.5,
                            child: Text('Pending'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue background
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.2,
                    vertical: screenHeight * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Handle continue button press
                  // You can add your navigation logic here
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 10,),
            _buildActionText(context)
          ],
        ),
      ),
    );
  }

  Widget _buildActionText(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(width: 10),
          Text(
            "Note:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "1. PAN CARD NO. WITH ATTACHMENT FILE..",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "2. AADHAR CARD, DRIVING LICENSE, VOTER ID NO. WITH ATTACHMENT FILE ",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "3. BANK PASSBOOK OR CANCEL CHEQUE WITH ATTACHMENT FILE ",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "4. ONLY JPG AND PNG FORMAT IS ALLOWED ",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  DataCell _buildDataCell(Widget content) {
    return DataCell(
      content,
    );
  }

  double _getTitleFontSize(double width) {
    if (width < 600) {
      return 24;
    } else if (width < 1200) {
      return 30;
    } else {
      return 36;
    }
  }
}
