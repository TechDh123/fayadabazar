import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class SendFundRequest extends StatefulWidget {
  const SendFundRequest({super.key});

  @override
  State<SendFundRequest> createState() => _SendFundRequestState();
}

class _SendFundRequestState extends State<SendFundRequest> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fromBankController = TextEditingController();
  final TextEditingController _toBankController = TextEditingController();
  final TextEditingController _paymentModeController = TextEditingController();
  final TextEditingController _chequeOrDDNumberController = TextEditingController();
  final TextEditingController _fundAmountController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _checkDateController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _chosenFileName = 'No file chosen';

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _checkDateController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format date as YYYY-MM-DD
      });
    }
  }

  void _handleFilePick() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _chosenFileName = file.name;
      });
    } else {
      setState(() {
        _chosenFileName = 'No file chosen';
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle form submission
      // Add further submission logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form successfully submitted!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all required fields.')),
      );
    }
  }

  void _handleReset() {
    _formKey.currentState?.reset(); // Reset form state
    _fromBankController.clear();
    _toBankController.clear();
    _paymentModeController.clear();
    _chequeOrDDNumberController.clear();
    _fundAmountController.clear();
    _remarkController.clear();
    _checkDateController.clear();
    setState(() {
      _chosenFileName = 'No file chosen'; // Reset file picker state
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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
                  fontSize: isSmallScreen ? 30 : 36,
                ),
              ),
              TextSpan(
                text: 'bazar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: isSmallScreen ? 30 : 36,
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
            icon: Icon(Icons.search, color: Colors.white70),
            onPressed: () {
              // Add your search action here
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white70),
            onPressed: () {
              // Add your notifications action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    'Send Fund Request',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isSmallScreen ? 25 : 24,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueGrey[100]!, Colors.blue[200]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(color: Colors.black12, width: 2.0),
                    ),
                    child: Text(
                      'Payment Gateway',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: isSmallScreen ? 16 : 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),

                // From Bank TextField
                _buildTextField(
                  _fromBankController,
                  'From Bank Name',
                  prefixIcon: Icons.account_balance,
                  validator: (value) => value!.isEmpty ? 'Please enter From Bank Name' : null,
                ),
                SizedBox(height: 16.0),

                // To Bank TextField
                _buildTextField(
                  _toBankController,
                  'To Bank Name',
                  prefixIcon: Icons.account_balance,
                  validator: (value) => value!.isEmpty ? 'Please enter To Bank Name' : null,
                ),
                SizedBox(height: 16.0),

                // Payment Mode TextField
                _buildTextField(
                  _paymentModeController,
                  'Payment Mode',
                  prefixIcon: Icons.payment,
                  validator: (value) => value!.isEmpty ? 'Please enter Payment Mode' : null,
                ),
                SizedBox(height: 16.0),

                // Payment Proof Section
                Text(
                  'Payment Proof',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 18 : 20,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 8.0),

                // Choose File Section
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OutlinedButton(
                        onPressed: _handleFilePick,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: BorderSide(color: Colors.grey, width: 2.0),
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 13.0),
                        ),
                        child: Text('Choose File'),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          _chosenFileName,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: isSmallScreen ? 15 : 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),

                // Cheque or DD Number TextField
                _buildTextField(
                  _chequeOrDDNumberController,
                  'Cheque/DD Number',
                  prefixIcon: Icons.confirmation_number,
                  validator: (value) => value!.isEmpty ? 'Please enter Cheque/DD Number' : null,
                ),
                SizedBox(height: 16.0),

                // Check Date TextField
                TextField(
                  controller: _checkDateController,
                  decoration: InputDecoration(
                    labelText: 'Check Date',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  readOnly: true,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16.0),

                // Fund Amount TextField
                _buildTextField(
                  _fundAmountController,
                  'Fund Amount',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.monetization_on,
                  validator: (value) => value!.isEmpty ? 'Please enter Fund Amount' : null,
                ),
                SizedBox(height: 16.0),

                // Remark TextField
                _buildTextField(
                  _remarkController,
                  'Remark',
                  prefixIcon: Icons.comment,
                  validator: (value) => value!.isEmpty ? 'Please enter Remark' : null,
                ),
                SizedBox(height: 16.0),

                // Warning Text
                Text(
                  'Note: All fields with * are mandatory fields',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
                SizedBox(height: 20.0),

                // Submit and Reset Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: _handleSubmit,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueAccent, Colors.blue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isSmallScreen ? 16 : 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          onTap: _handleReset,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.orangeAccent, Colors.orange],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isSmallScreen ? 16 : 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // Helper method to build TextField widgets
  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text, required IconData prefixIcon, String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
