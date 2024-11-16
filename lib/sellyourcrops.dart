import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellYourCrops extends StatefulWidget {
  const SellYourCrops({Key? key}) : super(key: key);

  @override
  _SellYourCropsState createState() => _SellYourCropsState();

}

class _SellYourCropsState extends State<SellYourCrops> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  String? ownerName;
  String? cropType;
  String? description;
  String? contactNumber;
  String? price;
  String? quantity;  // Added quantity for crops in kg
  XFile? image1;
  XFile? image2;

  final List<String> cropTypes = ['Wheat', 'Rice', 'Corn', 'Sugarcane', 'Cotton'];

  Future<void> pickImage1() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image1 = pickedFile;
    });
  }

  Future<void> pickImage2() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image2 = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sell Your Crops',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 4), // Shadow position
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTextField('Owner\'s Name', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                }, (value) => ownerName = value, icon: Icons.person),
                const SizedBox(height: 12),
                _buildDropdownFormField('Crop Type', cropTypes, (value) => setState(() => cropType = value), icon: Icons.grain),
                const SizedBox(height: 12),
                _buildImagePickerRow('Choose File 1', image1, pickImage1),
                const SizedBox(height: 12),
                _buildImagePickerRow('Choose File 2', image2, pickImage2),
                const SizedBox(height: 12),
                _buildTextField('Description', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                }, (value) => description = value, maxLines: 4, icon: Icons.description),
                const SizedBox(height: 12),
                _buildTextField('Contact Number', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                }, (value) => contactNumber = value, keyboardType: TextInputType.phone, icon: Icons.phone),
                const SizedBox(height: 12),
                _buildTextField('Price (INR)', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                }, (value) => price = value, keyboardType: TextInputType.number, icon: Icons.attach_money),
                const SizedBox(height: 12),
                _buildTextField('Quantity (in kg)', (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quantity';
                  }
                  return null;
                }, (value) => quantity = value, keyboardType: TextInputType.number, icon: Icons.local_shipping),
                const SizedBox(height: 16),
                Center(child: _buildSubmitButton()), // Centered the submit button
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String? Function(String?) validator, Function(String?) onSaved,
      {int? maxLines, TextInputType? keyboardType, IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.blueAccent, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: maxLines == null ? 14 : 10),
        prefixIcon: icon != null ? Icon(icon, color: Colors.blueAccent) : null, // Adding icon
      ),
      validator: validator,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
    );
  }

  Widget _buildDropdownFormField(String label, List<String> items, Function(String?) onChanged, {IconData? icon}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.blueAccent, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: icon != null ? Icon(icon, color: Colors.blueAccent) : null, // Adding icon
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select $label';
        }
        return null;
      },
    );
  }

  Widget _buildImagePickerRow(String label, XFile? image, Function onPressed) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => onPressed(),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.blueAccent, // Button Color
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(image == null ? 'No file chosen' : image!.name)),
      ],
    );
  }
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          // Process the form data (e.g., save or submit to an API)
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Form Submitted')));
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ), // Button Color
      ),
      child: const Text('Submit', style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
