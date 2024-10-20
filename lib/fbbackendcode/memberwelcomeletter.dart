import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:excel/excel.dart' as excel;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class MemberWelcomeLetter extends StatefulWidget {
  const MemberWelcomeLetter({super.key});

  @override
  State<MemberWelcomeLetter> createState() => _MemberWelcomeLetterState();
}

class _MemberWelcomeLetterState extends State<MemberWelcomeLetter> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _memberNameController = TextEditingController();
  final TextEditingController _sponsorIdController = TextEditingController();
  final TextEditingController _sponsorNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _vendorNameController = TextEditingController();
  final TextEditingController _packageNameController = TextEditingController();

  List<Map<String, String>> records = []; // Store records
  int recordsToShow = 10; // Default records to show

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  InputDecoration _buildInputDecoration(String labelText, {IconData? prefixIcon, IconData? suffixIcon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
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
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.deepPurple) : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.deepPurple) : null,
    );
  }

  void _exportToExcel() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var excelFile = excel.Excel.createExcel();
      excel.Sheet sheet = excelFile['Sheet1'];

      sheet.appendRow([
        'Member ID', 'Member Name', 'Sponsor ID', 'Sponsor Name', 'Email', 'Mobile Number', 'PAN', 'Vendor Name', 'Package Name'
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
      ]);

      Directory? downloadsDirectory = await getDownloadsDirectory();
      if (downloadsDirectory != null) {
        String path = "${downloadsDirectory.path}/records.xlsx";
        final file = File(path);
        await file.writeAsBytes(await excelFile.save() ?? []);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Excel file created: $path')),
        );

        Share.shareFiles([path], text: 'Here is the records Excel file!', mimeTypes: ['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']);
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
        'SrNo': (records.length + 1).toString(),
        'MemberId': _memberIdController.text,
        'DOJ': _fromDateController.text, // Assuming DOJ is the From Date
        'MemberName': _memberNameController.text,
        'SponsorId': _sponsorIdController.text,
        'SponsorName': _sponsorNameController.text,
        'PackageName': _packageNameController.text,
        'PackagePrice': '100', // Example static price
        'GSTNo': 'GST123456', // Example static GST No
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
        elevation: 8,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.indigoAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          "Member Welcome Letter",
          style: TextStyle(
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildCustomFormField("From Date", _fromDateController, suffixIcon: Icons.calendar_today),
              _buildCustomFormField("To Date", _toDateController, suffixIcon: Icons.calendar_today),
              _buildCustomFormField("Member ID", _memberIdController),
              _buildCustomFormField("Member Name", _memberNameController),
              _buildCustomFormField("Sponsor ID", _sponsorIdController),
              _buildCustomFormField("Sponsor Name", _sponsorNameController),
              _buildCustomFormField("Email", _emailController, inputType: TextInputType.emailAddress),
              _buildCustomFormField("Mobile Number", _mobileController, inputType: TextInputType.phone),
              _buildCustomFormField("PAN", _panController, prefixIcon: Icons.credit_card, suffixIcon: Icons.check),
              _buildCustomFormField("Vendor Name", _vendorNameController),
              _buildCustomFormField("Package Name", _packageNameController),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _searchMembers,
                    child: const Text(
                      'Search Members',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  Spacer(),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Records:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton.icon(
                    onPressed: _exportToExcel,
                    icon: const Icon(Icons.file_download, color: Colors.white),
                    label: const Text(
                      'Download Excel',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildTransactionTable(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomFormField(String labelText, TextEditingController controller,
      {IconData? prefixIcon, IconData? suffixIcon, TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: _buildInputDecoration(labelText, prefixIcon: prefixIcon, suffixIcon: suffixIcon),
        keyboardType: inputType,
        readOnly: suffixIcon == Icons.calendar_today,
        onTap: suffixIcon == Icons.calendar_today ? () => _selectDate(context, controller) : null,
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
            DataColumn(label: Text('DOJ')),
            DataColumn(label: Text('Member Name')),
            DataColumn(label: Text('Sponsor ID')),
            DataColumn(label: Text('Sponsor Name')),
            DataColumn(label: Text('Package Name')),
            DataColumn(label: Text('Package Price')),
            DataColumn(label: Text('GST')),
          ],
          rows: List<DataRow>.generate(
            recordsToShow, // Use the selected number of records
                (index) => DataRow(
              cells: [
                DataCell(Text((index + 1).toString())),
                DataCell(Text('TXN${index + 100}')),
                DataCell(Text('MEM${index + 1}')),
                DataCell(Text('Vendor ${index + 1}')),
                DataCell(Text('Sample Service')),
                DataCell(Text('\$100.00')),
                DataCell(Text('\$50.00')),
                DataCell(Text('\$50.00')),
                DataCell(Text('\$50.00')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
