import 'package:flutter/material.dart';

class ChangeTransactionPassword extends StatefulWidget {
  const ChangeTransactionPassword({super.key});

  @override
  State<ChangeTransactionPassword> createState() => _ChangeTransactionPasswordState();
}

class _ChangeTransactionPasswordState extends State<ChangeTransactionPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mailIdController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
              elevation: 4.0, // Adds shadow to AppBar
            ),
            Container(
              color: Colors.black,
              height: 1.0,
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'Change My Transaction Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth < 600 ? 20 : 24,
                  color: Colors.blueGrey[800],
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
          key: _formKey, // Add Form widget with key
          child: ListView(
            children: [
              _buildTextField(
                label: 'Mail ID *',
                controller: _mailIdController,
                validator: (value) => value == null || value.isEmpty ? 'Please enter your mail ID' : null,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'Current Transaction Password *',
                controller: _currentPasswordController,
                validator: (value) => value == null || value.isEmpty ? 'Please enter your current password' : null,
                obscureText: true,
                icon: Icons.lock,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'New Transaction Password *',
                controller: _newPasswordController,
                validator: (value) => value == null || value.isEmpty ? 'Please enter your new password' : null,
                obscureText: true,
                icon: Icons.lock,
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                label: 'Confirm Transaction Password *',
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                obscureText: true,
                icon: Icons.lock,
              ),
              SizedBox(height: 16.0),
              Text(
                'Note: All fields with * are mandatory',
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
                      // Clear the text fields
                      _mailIdController.clear();
                      _currentPasswordController.clear();
                      _newPasswordController.clear();
                      _confirmPasswordController.clear();

                      // Reset the form state
                      _formKey.currentState?.reset();
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

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    required IconData icon,
  }) {
    return Card(
      elevation: 4.0, // Adds shadow to card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueGrey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          errorStyle: TextStyle(color: Colors.red), // Custom error text style
        ),
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
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
        elevation: 4.0, // Adds shadow to button
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
