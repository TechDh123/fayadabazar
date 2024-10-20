
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DirectIncome extends StatefulWidget {
  const DirectIncome({super.key});

  @override
  State<DirectIncome> createState() => _DirectIncomeState();
}

class _DirectIncomeState extends State<DirectIncome> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context,
      TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        // Deep Blue color
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
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
          onPressed: () {
            // Add your dashboard action here
          },
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
      body: Padding(
        padding: _getBodyPadding(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTransactionForm(context),
              const SizedBox(height: 20.0),
              _buildActionButtons(context),
              const SizedBox(height: 20.0),
              _buildTransactionTable(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the Transaction Form
  Widget _buildTransactionForm(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _getCardHorizontalPadding(context)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Direct Income',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _getTitleFontSize(context) - 4,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // From Date Field
              _buildDateField(
                  'From Date *', Icons.date_range, _fromDateController,
                  context),
              const SizedBox(height: 16.0),

              _buildDateField(
                  'To Date *', Icons.date_range, _toDateController, context),
              const SizedBox(height: 16.0),

              // Narration Field
              _buildTextField('Member ID *', Icons.comment),
              const SizedBox(height: 16.0),

              // Transaction ID Field
              _buildTextField('Vendor ID *', Icons.confirmation_number),
              const SizedBox(height: 20.0),

              // Warning Note
              const Text(
                'Note: Fields with * are mandatory.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20.0),

              // Submit Button
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(
                            horizontal: _getButtonHorizontalPadding(context),
                            vertical: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white,
                            fontSize: _getButtonFontSize(context)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the Total Records and Export Buttons
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10,),
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10), // Padding around the container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Export Text
              Text(
                'Export',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: _getButtonFontSize(context), // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 8), // Normal space between text and image

              // Excel Image
              Image.asset(
                'assets/images/img.png', // Add Excel icon asset
                width: 40,
                height: 30,
              ),
            ],
          ),
        ),
      ],
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
            DataColumn(label: Text('S.No')),
            DataColumn(label: Text('Invoice No')),
            DataColumn(label: Text('Vendor ID')),
            DataColumn(label: Text('Vendor Name')),
            DataColumn(label: Text('Service')),
            DataColumn(label: Text('Amount')),
            DataColumn(label: Text('Discount')),
            DataColumn(label: Text('Net Amount')),
          ],
          rows: List<DataRow>.generate(
            5,
                (index) =>
                DataRow(
                  cells: [
                    DataCell(Text((index + 1).toString())),
                    DataCell(Text('TXN${index + 100}')),
                    DataCell(Text('MEM${index + 1}')),
                    DataCell(Text('Vendor ${index + 1}')),
                    DataCell(Text('Sample Service')),
                    DataCell(Text('\$100.00')),
                    DataCell(Text('\$50.00')),
                    DataCell(Text('\$50.00')),
                  ],
                ),
          ),
        ),
      ),
    );
  }

  // Dynamic sizing helpers for responsiveness
  double _getTitleFontSize(BuildContext context) {
    if (MediaQuery
        .of(context)
        .size
        .width < 600) {
      return 24;
    } else if (MediaQuery
        .of(context)
        .size
        .width < 1200) {
      return 30;
    } else {
      return 36;
    }
  }

  EdgeInsets _getBodyPadding(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width < 600
        ? const EdgeInsets.all(8.0)
        : const EdgeInsets.all(16.0);
  }

  double _getCardHorizontalPadding(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width < 600 ? 8.0 : 16.0;
  }

  double _getButtonHorizontalPadding(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width < 600 ? 8.0 : 16.0;
  }

  double _getButtonFontSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width < 600 ? 16.0 : 20.0;
  }

  // Date field widget
  Widget _buildDateField(String label, IconData icon,
      TextEditingController controller, BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      readOnly: true,
      onTap: () {
        _selectDate(
            context, controller); // Access the _selectDate method from here
      },
    );
  }

  // Generic text field widget
  Widget _buildTextField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}