import 'package:flutter/material.dart';

class EWalletTransaction extends StatefulWidget {
  const EWalletTransaction({super.key});

  @override
  State<EWalletTransaction> createState() => _EWalletTransactionState();
}

class _EWalletTransactionState extends State<EWalletTransaction> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F51B5), // Deep Blue color
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
            onPressed: () {
              // Add your search action here
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Add your notifications action here
            },
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
        padding: EdgeInsets.symmetric(horizontal: _getCardHorizontalPadding(context)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'E-Wallet Transaction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _getTitleFontSize(context) - 4,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // From Date Field
              _buildTextField('From Date *', Icons.date_range),
              const SizedBox(height: 16.0),

              // To Date Field
              _buildTextField('To Date *', Icons.date_range),
              const SizedBox(height: 16.0),

              // Narration Field
              _buildTextField('Narration *', Icons.comment),
              const SizedBox(height: 16.0),

              // Transaction ID Field
              _buildTextField('Transaction ID *', Icons.confirmation_number),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple, // Primary color
                        padding: EdgeInsets.symmetric(horizontal: _getButtonHorizontalPadding(context), vertical: 12),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: _getButtonFontSize(context)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }

  // Widget for the Total Records and Export Buttons
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Total Records Button
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Handle total records action
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey, width: 1.0),
              ),
              elevation: 2,
              padding: EdgeInsets.symmetric(horizontal: _getButtonHorizontalPadding(context), vertical: 10),
            ),
            child: const Text('Total Records'),
          ),
        ),

        const SizedBox(width: 10),

        // Export to Excel Button with Excel Icon
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
              foregroundColor: Colors.black, backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey, width: 1.0),
              ),
              elevation: 2,
              padding: EdgeInsets.symmetric(horizontal: _getButtonHorizontalPadding(context), vertical: 10),
            ),
          ),
        ),
      ],
    );
  }

  // Widget for the Transaction Table
  Widget _buildTransactionTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: DataTable(
          columnSpacing: 16.0,
          headingTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          dataTextStyle: TextStyle(
            color: Colors.black87,
          ),
          columns: const [
            DataColumn(label: Text('S.No')),
            DataColumn(label: Text('Transaction ID')),
            DataColumn(label: Text('Member ID')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Narration')),
            DataColumn(label: Text('Credit')),
            DataColumn(label: Text('Debit')),
            DataColumn(label: Text('Balance')),
          ],
          rows: List<DataRow>.generate(
            5, // Sample data rows
                (index) => DataRow(
              cells: [
                DataCell(Text((index + 1).toString())),
                DataCell(Text('TXN${index + 100}')),
                DataCell(Text('MEM${index + 1}')),
                DataCell(Text('2023-09-01')),
                DataCell(Text('Sample Narration')),
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
    if (MediaQuery.of(context).size.width < 600) {
      return 24;
    } else if (MediaQuery.of(context).size.width < 1200) {
      return 30;
    } else {
      return 36;
    }
  }

  EdgeInsets _getBodyPadding(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? const EdgeInsets.all(8.0)
        : const EdgeInsets.all(16.0);
  }

  double _getCardHorizontalPadding(BuildContext context) {
    return MediaQuery.of(context).size.width < 600 ? 8 : 20;
  }

  double _getButtonHorizontalPadding(BuildContext context) {
    return MediaQuery.of(context).size.width < 600 ? 16 : 24;
  }

  double _getButtonFontSize(BuildContext context) {
    return MediaQuery.of(context).size.width < 600 ? 14 : 16;
  }

  // Helper function to build form fields
  Widget _buildTextField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        return null;
      },
    );
  }
}