import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReferralIncome extends StatefulWidget {
  const ReferralIncome({super.key});

  @override
  State<ReferralIncome> createState() => _ReferralIncomeState();
}

class _ReferralIncomeState extends State<ReferralIncome> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final TextEditingController _txIdController = TextEditingController();
  final TextEditingController _apiTxIdController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  final List<String> _types = ['Type 1', 'Type 2', 'Type 3'];
  final List<String> _operators = ['Operator 1', 'Operator 2', 'Operator 3'];
  final List<String> _statuses = ['Pending', 'Completed', 'Failed'];

  String? _selectedType;
  String? _selectedOperator;
  String? _selectedStatus;

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = DateFormat('dd-MM-yy').format(picked);
    }
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all mandatory fields correctly.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _handleTotalRecordsButton() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Total Records button pressed!'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  fontSize: _getTitleFontSize(context),
                ),
              ),
              TextSpan(
                text: 'bazar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: _getTitleFontSize(context),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Referral Income',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  _buildDateField(_fromDateController, 'From Date *'),
                  _buildDateField(_toDateController, 'To Date *'),
                  _buildTextField(_txIdController, 'Member Id *'),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Notes: Fields with * are mandatory.',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _validateAndSubmit,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: const Text(

                          'Submit',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                          _fromDateController.clear();
                          _toDateController.clear();
                          _txIdController.clear();
                          _apiTxIdController.clear();
                          _mobileController.clear();
                          setState(() {
                            _selectedType = null;
                            _selectedOperator = null;
                            _selectedStatus = null;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: const Text(
                          'Reset',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _handleTotalRecordsButton,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        child: Text(
                          'Total Record(s): 1',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 50, // Set height for the container
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                'assets/images/img.png',
                                height: 40, // Height of each image
                                width: 40, // Width of each image
                                fit: BoxFit.contain, // Ensure the image scales correctly
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Image.asset(
                                'assets/images/v2.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Image.asset(
                                'assets/images/v3.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('S.No.')),
                        DataColumn(label: Text('Source')),
                        DataColumn(label: Text('Mobile no.')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Operator Name')),
                        DataColumn(label: Text('Service Type')),
                        DataColumn(label: Text('Tx id')),
                        DataColumn(label: Text('API Tx ID')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('1')),
                          DataCell(Text('Source 1')),
                          DataCell(Text('1234567890')),
                          DataCell(Text('\$100')),
                          DataCell(Text('Operator 1')),
                          DataCell(Text('Type 1')),
                          DataCell(Text('TX123')),
                          DataCell(Text('API123')),
                        ]),
                        // Add more rows here as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (label.contains('*') && (value == null || value.isEmpty)) {
            return 'This field is required.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDateField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => _selectDate(controller),
        child: AbsorbPointer(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (label.contains('*') && (value == null || value.isEmpty)) {
                return 'This field is required.';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown<T>(
      String label,
      List<T> items,
      ValueChanged<T?> onChanged,
      T? selectedItem,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        value: selectedItem,
        onChanged: onChanged,
        validator: (value) {
          if (label.contains('*') && value == null) {
            return 'This field is required.';
          }
          return null;
        },
        items: items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
      ),
    );
  }

  double _getTitleFontSize(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return 24;
    } else if (MediaQuery.of(context).size.width < 1200) {
      return 30;
    } else {
      return 36;
    }
  }
}
