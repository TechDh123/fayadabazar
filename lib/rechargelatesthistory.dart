import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RechargeLatestHistory extends StatefulWidget {
  const RechargeLatestHistory({super.key});

  @override
  State<RechargeLatestHistory> createState() => _RechargeLatestHistoryState();
}

class _RechargeLatestHistoryState extends State<RechargeLatestHistory> {
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
                      'Recharge Latest History',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  _buildDateField(_fromDateController, 'From Date *'),
                  _buildDateField(_toDateController, 'To Date *'),
                  _buildTextField(_txIdController, 'Transaction ID *'),
                  _buildTextField(_apiTxIdController, 'API Transaction ID'),
                  _buildDropdown<String>(
                    'Select Type *',
                    _types,
                        (value) => setState(() => _selectedType = value),
                    _selectedType,
                  ),
                  _buildDropdown<String>(
                    'Operator Name *',
                    _operators,
                        (value) => setState(() => _selectedOperator = value),
                    _selectedOperator,
                  ),
                  _buildTextField(_mobileController, 'Mobile Number *'),
                  _buildDropdown<String>(
                    'Status *',
                    _statuses,
                        (value) => setState(() => _selectedStatus = value),
                    _selectedStatus,
                  ),
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
            const SizedBox(height: 20),
            _buildActionButtons(context),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                dividerThickness: 2,
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

  double _getButtonHorizontalPadding(BuildContext context) {
    return MediaQuery.of(context).size.width < 600 ? 8.0 : 16.0;
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              elevation: 2,
              padding: EdgeInsets.symmetric(
                horizontal: _getButtonHorizontalPadding(context),
                vertical: 8,
              ),
            ),
            child: const Text('Total Record(s): 1'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            child: Center(
              child: Image.asset(
                'assets/images/img.png',
                width: 40,
                height: 30,
              ),
            ),
            onPressed: () {
              // Handle export to Excel action
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              elevation: 2,
              padding: EdgeInsets.symmetric(
                horizontal: _getButtonHorizontalPadding(context),
                vertical: 10,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            child: Center(
              child: Image.asset(
                'assets/images/word.png',
                width: 40,
                height: 30,
              ),
            ),
            onPressed: () {
              // Handle export to PDF action
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              elevation: 2,
              padding: EdgeInsets.symmetric(
                horizontal: _getButtonHorizontalPadding(context),
                vertical: 10,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            child: Center(
              child: Image.asset(
                'assets/images/pdf.png',
                width: 40,
                height: 30,
              ),
            ),
            onPressed: () {
              // Handle export to PDF action
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              elevation: 2,
              padding: EdgeInsets.symmetric(
                horizontal: _getButtonHorizontalPadding(context),
                vertical: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
