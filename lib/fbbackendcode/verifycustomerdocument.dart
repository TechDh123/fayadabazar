import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:excel/excel.dart' as excel;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class VerifyCustomerDocument extends StatefulWidget {
  const VerifyCustomerDocument({super.key});

  @override
  State<VerifyCustomerDocument> createState() => _VerifyCustomerDocumentState();
}

class _VerifyCustomerDocumentState extends State<VerifyCustomerDocument> {
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final TextEditingController _memberNameController = TextEditingController();
  final TextEditingController _sponsorIdController = TextEditingController();
  final TextEditingController _sponsorNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _vendorNameController = TextEditingController();
  final TextEditingController _packageNameController = TextEditingController();
  final TextEditingController _actionController = TextEditingController();
  final TextEditingController _createDataController = TextEditingController();

  List<Map<String, String>> records = []; // Store records
  int recordsToShow = 10; // Default records to show

  InputDecoration _buildInputDecoration(String labelText,
      {IconData? prefixIcon, IconData? suffixIcon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
      ),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Colors.deepPurple)
          : null,
      suffixIcon: suffixIcon != null
          ? Icon(suffixIcon, color: Colors.deepPurple)
          : null,
    );
  }

  void _exportToExcel() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var excelFile = excel.Excel.createExcel();
      excel.Sheet sheet = excelFile['Sheet1'];

      sheet.appendRow([
        'Member ID',
        'Member Name',
        'Sponsor ID',
        'Sponsor Name',
        'Email',
        'Mobile Number',
        'PAN',
        'Vendor Name',
        'Package Name'
      ]);

      sheet.appendRow([
        _memberIdController.text,
        _memberNameController.text,
        _sponsorIdController.text,
        _sponsorNameController.text,
        _emailController.text,
        _mobileController.text,
        _panController.text,
        _vendorNameController.text,
        _packageNameController.text,
        _actionController.text,
        _createDataController.text
      ]);

      Directory? downloadsDirectory = await getDownloadsDirectory();
      if (downloadsDirectory != null) {
        String path = "${downloadsDirectory.path}/records.xlsx";
        final file = File(path);
        await file.writeAsBytes(await excelFile.save() ?? []);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Excel file created: $path')),
        );

        Share.shareFiles([path],
            text: 'Here is the records Excel file!',
            mimeTypes: [
              'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            ]);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to get Downloads directory')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied!')),
      );
    }
  }

  Future<Directory?> getDownloadsDirectory() async {
    if (Platform.isAndroid) {
      return Directory('/storage/emulated/0/Download');
    } else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    }
    return null;
  }

  void _searchMembers() {
    setState(() {
      records.add({
        'MSrNo': (records.length + 1).toString(),
        'MemberId': _memberIdController.text,
        
        'Action': _actionController.text, // Example static price
        'Create Data' : _createDataController.text, // Example static GST No
      });
    });

    // Clear input fields after search
    _memberIdController.clear();
    _memberNameController.clear();
    _sponsorIdController.clear();
    _sponsorNameController.clear();
    _packageNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Verify Customer",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Times New Roman",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _memberIdController,
              decoration: _buildInputDecoration("Member ID"),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _mobileController,
              decoration: _buildInputDecoration("Mobile Number"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 40.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _searchMembers,
                  child: const Text(
                    'Search',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Spacer(),
                const SizedBox(width: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: recordsToShow,
                      items: const [
                        DropdownMenuItem(value: 10, child: Text('10 Records')),
                        DropdownMenuItem(value: 100, child: Text('100 Records')),
                        DropdownMenuItem(value: 1000, child: Text('1000 Records')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          recordsToShow = value ?? 10;
                        });
                      },
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildTransactionTable(),
          ],
        ),
      ),
      ),
    );
  }

  Widget _buildTransactionTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: DataTable(
          columnSpacing: 16.0,
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          dataTextStyle: const TextStyle(
            color: Colors.black87,
          ),
          border: TableBorder(
            horizontalInside: const BorderSide(width: 1, color: Colors.grey),
            verticalInside: const BorderSide(width: 1, color: Colors.grey),
            top: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
            bottom: BorderSide.none,
          ),
          columns: const [
            DataColumn(label: Text('Sr.no')),
            DataColumn(label: Text('Member ID')),
            DataColumn(label: Text("Action")),
            DataColumn(label: Text("Create Date "))
          ],
          rows: List<DataRow>.generate(
            recordsToShow,
                (index) => DataRow(
              cells: [
                DataCell(Text((index + 1).toString())),
                DataCell(Text('TXN${index + 100}')),
                DataCell(Text('MEM${index + 1}')),
                DataCell(Text('Vendor ${index + 1}')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
