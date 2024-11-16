import 'package:flutter/material.dart';

class VendorBigRegistrationForm extends StatefulWidget {
  const VendorBigRegistrationForm({super.key});

  @override
  State<VendorBigRegistrationForm> createState() => _VendorBigRegistrationFormState();
}

class _VendorBigRegistrationFormState extends State<VendorBigRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each field
  final TextEditingController memberIdController = TextEditingController();
  final TextEditingController vendorNameController = TextEditingController();
  final TextEditingController firmNameController = TextEditingController();
  final TextEditingController categoryOfFirmController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController countryNameController = TextEditingController();
  final TextEditingController stateNameController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappNoController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController cashBackNoController = TextEditingController();
  final TextEditingController timeDurationController = TextEditingController();
  final TextEditingController minimumBillAmountController = TextEditingController();
  final TextEditingController gstNoController = TextEditingController();
  final TextEditingController businessDetailsController = TextEditingController();
  final TextEditingController openingTimeController = TextEditingController();
  final TextEditingController closingTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vendor Registration Form')),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                _buildTextField("Member Id", memberIdController, Icons.person),
                _buildTextField("Vendor Name", vendorNameController, Icons.business),
                _buildTextField("Firm Name", firmNameController, Icons.apartment),
                _buildTextField("Category of Firm", categoryOfFirmController, Icons.category),
                _buildTextField("Category", categoryController, Icons.label),
                _buildTextField("Mobile", mobileController, Icons.phone),
                _buildTextField("Country Name", countryNameController, Icons.public),
                _buildTextField("State Name", stateNameController, Icons.location_city),
                _buildTextField("District", districtController, Icons.map),
                _buildTextField("City Name", cityNameController, Icons.location_on),
                _buildTextField("Address", addressController, Icons.home),
                _buildTextField("Pincode", pincodeController, Icons.pin),
                _buildTextField("Email", emailController, Icons.email),
                _buildTextField("WhatsApp No.", whatsappNoController, Icons.chat),
                _buildTextField("Website", websiteController, Icons.web),
                _buildTextField("Cash Back No.", cashBackNoController, Icons.money),
                _buildTextField("Time Duration", timeDurationController, Icons.access_time),
                _buildTextField("Minimum Bill Amount", minimumBillAmountController, Icons.attach_money),
                _buildTextField("GST No.", gstNoController, Icons.article),
                _buildTextField("Business Details", businessDetailsController, Icons.description),
                _buildTextField("Opening Time", openingTimeController, Icons.access_alarm),
                _buildTextField("Closing Time", closingTimeController, Icons.access_alarm),
                _buildDescriptionField("Description", descriptionController),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.orange, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rectangular corners
                        side: BorderSide(color: Colors.orange), // Border color
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process the registration
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Submit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Bold text
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDescriptionField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        maxLines: 5,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }
}
