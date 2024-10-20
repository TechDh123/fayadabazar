import 'package:flutter/material.dart';

class ChangeMyPassword extends StatefulWidget {
  const ChangeMyPassword({super.key});

  @override
  State<ChangeMyPassword> createState() => _ChangeMyPasswordState();
}

class _ChangeMyPasswordState extends State<ChangeMyPassword> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedBank;
  String? _selectedAccountType;
  final List<String> _banks = ['Bank A', 'Bank B', 'Bank C']; // Example banks
  final List<String> _accountTypes = ['Savings', 'Checking']; // Example account types
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _accountHolderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenWidth < 600 ? 160.0 : 180.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              centerTitle: true,
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Fayda',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: screenWidth < 600 ? 30 : 36,
                      ),
                    ),
                    TextSpan(
                      text: 'bazar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: screenWidth < 600 ? 30 : 36,
                      ),
                    ),
                  ],
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.dashboard, color: Colors.orange),
                onPressed: () {
                  // Add your dashboard action here
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.blue),
                  onPressed: () {
                    // Add your search action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.blue),
                  onPressed: () {
                    // Add your notifications action here
                  },
                ),
              ],
            ),
            Container(
              color: Colors.black,
              height: 1.0,
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'Change My Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth < 600 ? 25 : 24,
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildDropdown(
                hint: 'Select Bank *',
                value: _selectedBank,
                items: _banks,
                onChanged: (value) {
                  setState(() {
                    _selectedBank = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a bank' : null,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'Branch Name *',
                controller: null,
                validator: (value) => value == null || value.isEmpty ? 'Please enter bank name' : null,
              ),
              SizedBox(height: 16.0),
              _buildDropdown(
                hint: 'Select Account Type *',
                value: _selectedAccountType,
                items: _accountTypes,
                onChanged: (value) {
                  setState(() {
                    _selectedAccountType = value;
                  });
                },
                validator: (value) => value == null ? 'Please select an account type' : null,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'Account Number *',
                controller: _accountNumberController,
                validator: (value) => value == null || value.isEmpty ? 'Please enter account number' : null,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'IFSC Code *',
                controller: _ifscCodeController,
                validator: (value) => value == null || value.isEmpty ? 'Please enter IFSC code' : null,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'Account Holder Name *',
                controller: _accountHolderController,
                validator: (value) => value == null || value.isEmpty ? 'Please enter account holder name' : null,
              ),
              SizedBox(height: 16.0),
              Text(
                'Note: All the fields with * are mandatory',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(
                    text: 'Submit',
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle submit action
                      }
                    },
                  ),
                  _buildButton(
                    text: 'Reset',
                    color: Colors.orange,
                    onPressed: () {
                      _formKey.currentState?.reset();
                      setState(() {
                        _selectedBank = null;
                        _selectedAccountType = null;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(hint),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextEditingController? controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        errorStyle: TextStyle(color: Colors.red), // Custom error text style
      ),
      validator: validator,
      keyboardType: keyboardType,
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required void Function() onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
