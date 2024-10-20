import 'package:faydabazar/termsandconditions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MemberMaster extends StatefulWidget {
  const MemberMaster({super.key});

  @override
  State<MemberMaster> createState() => _MemberMasterState();
}


class _MemberMasterState extends State<MemberMaster> {
  final _nameController = TextEditingController();
  final _sponsorCodeController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _nomineeNameController = TextEditingController();
  final _nomineeAgeController = TextEditingController();
  final _nomineeRelationController = TextEditingController();
  final _addressController = TextEditingController();
  final _districtnameController = TextEditingController();
  final _cityNameController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _panNumberController = TextEditingController();
  final _aadharNumberController = TextEditingController();

  // New controllers for bank details
  final _bankNameController = TextEditingController();
  final _accountTypeController = TextEditingController();
  final _accountHolderNameController = TextEditingController();
  final _branchNameController = TextEditingController();
  final _ifscCodeController = TextEditingController();

  String? _selectedOccupation;
  String? _selectedCountry;
  String? _selectedState;
  String? _selectedDistrict;

  final List<String> _occupations = ['Government Jobs', 'Private Jobs', 'Others'];

  // List of country names in alphabetical order
  final List<String> _countries = [
    'Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Antigua and Barbuda', 'Argentina',
    'Armenia', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados',
    'Belarus', 'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina', 'Botswana',
    'Brazil', 'Brunei', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cabo Verde', 'Cambodia', 'Cameroon',
    'Canada', 'Central African Republic', 'Chad', 'Chile', 'China', 'Colombia', 'Comoros', 'Congo',
    'Costa Rica', 'Croatia', 'Cuba', 'Cyprus', 'Czech Republic', 'Denmark', 'Djibouti', 'Dominica',
    'Dominican Republic', 'East Timor', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea',
    'Eritrea', 'Estonia', 'Eswatini', 'Ethiopia', 'Fiji', 'Finland', 'France', 'Gabon', 'Gambia',
    'Georgia', 'Germany', 'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea', 'Guinea-Bissau',
    'Guyana', 'Haiti', 'Honduras', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq',
    'Ireland', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati',
    'Korea, North', 'Korea, South', 'Kosovo', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon',
    'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Madagascar',
    'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Mauritania', 'Mauritius',
    'Mexico', 'Micronesia', 'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique',
    'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'New Zealand', 'Nicaragua', 'Niger',
    'Nigeria', 'North Macedonia', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Panama', 'Papua New Guinea',
    'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal', 'Qatar', 'Romania', 'Russia', 'Rwanda',
    'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Vincent and the Grenadines', 'Samoa', 'San Marino',
    'Sao Tome and Principe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone',
    'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Sudan',
    'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Sweden', 'Switzerland', 'Syria', 'Taiwan', 'Tajikistan',
    'Tanzania', 'Thailand', 'Togo', 'Tonga', 'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan',
    'Tuvalu', 'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States', 'Uruguay',
    'Uzbekistan', 'Vanuatu', 'Vatican City', 'Venezuela', 'Vietnam', 'Yemen', 'Zambia', 'Zimbabwe'
  ];

  // List of Indian states
  final List<String> _states = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana',
    'Himachal Pradesh', 'Jharkhand', 'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
    'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu',
    'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal', 'Andaman and Nicobar Islands',
    'Chandigarh',  'Delhi ',
    'Lakshadweep', 'Puducherry', 'Ladakh', 'Jammu and Kashmir'
  ];

  final List<String> _districts = ['District1', 'District2', 'District3'];

  bool _istermsAccepted = false;

  @override
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        // Format the date as DD-MM-YY
        _dobController.text = DateFormat('dd-MM-yy').format(pickedDate);
      });
    }
  }


  Widget _buildTextField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType, // Valid parameter for TextFormField
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void dispose() {
    // Dispose existing controllers
    _nameController.dispose();
    _sponsorCodeController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _fatherNameController.dispose();
    _dobController.dispose();
    _nomineeNameController.dispose();
    _nomineeAgeController.dispose();
    _nomineeRelationController.dispose();
    _addressController.dispose();
    _cityNameController.dispose();
    _pinCodeController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _panNumberController.dispose();
    _aadharNumberController.dispose();

    // Dispose new controllers
    _bankNameController.dispose();
    _accountTypeController.dispose();
    _accountHolderNameController.dispose();
    _branchNameController.dispose();
    _ifscCodeController.dispose();

    super.dispose();
  }

  void _handleSubmit() {
    if (_istermsAccepted) {
      // Handle form submission
      print("Form submitted");
    } else {
      // Show error or warning message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must accept the Terms and Conditions')),
      );
    }
  }

  void _handleReset() {
    // Reset all controllers
    _nameController.clear();
    _sponsorCodeController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _fatherNameController.clear();
    _dobController.clear();
    _nomineeNameController.clear();
    _nomineeAgeController.clear();
    _nomineeRelationController.clear();
    _addressController.clear();
    _cityNameController.clear();
    _pinCodeController.clear();
    _emailController.clear();
    _mobileController.clear();
    _panNumberController.clear();
    _aadharNumberController.clear();
    _bankNameController.clear();
    _accountTypeController.clear();
    _accountHolderNameController.clear();
    _branchNameController.clear();
    _ifscCodeController.clear();
    setState(() {
      _selectedOccupation = null;
      _selectedCountry = null;
      _selectedState = null;
      _selectedDistrict = null;
      _istermsAccepted = false;
    });
  }

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
            SizedBox(height: 40.0),
            Center(
              child: Column(
                children: [
                  Text(
                    'Member Master',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth < 600 ? 25 : 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? 16.0 : 24.0),
        child: ListView(
          children: [
            // Sponsor Info Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Note: Fields with * are mandatory fields',
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 12 : 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.orange, size: 24.0),
                      SizedBox(width: 8.0),
                      Text(
                        'Sponsor Info',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 600 ? 18 : 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(_sponsorCodeController, 'Sponsor Code'),
                  SizedBox(height: 16.0),
                  Container(
                    color: Colors.black,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Personal Information Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.orange, size: 24.0),
                      SizedBox(width: 8.0),
                      Text(
                        'Personal Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 600 ? 18 : 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),

                  _buildTextField(_firstNameController, 'First Name'),
                  SizedBox(height: 16.0),
                  _buildTextField(_lastNameController, 'Last Name'),
                  SizedBox(height: 16.0),
                  _buildTextField(_fatherNameController, 'Father\'s Name'),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _dobController,
                    decoration: InputDecoration(
                      labelText: 'Date of Birth (DD-MM-YY)',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true, // Make the TextField read-only to prevent manual input
                  ),
                  SizedBox(height: 16.0),

                  Container(
                    width: 300.0, // Fixed width for mobile devices
                    child: DropdownButtonFormField<String>(
                      value: _selectedOccupation,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedOccupation = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Occupation',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      ),
                      items: _occupations.map((occupation) {
                        return DropdownMenuItem(
                          value: occupation,
                          child: Text(occupation),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Row(
                    children: [
                      Icon(Icons.person_add_alt_1_outlined, color: Colors.orange, size: 24.0),
                      SizedBox(width: 8.0),
                      Text(
                        'Nominee Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 600 ? 18 : 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(_nomineeNameController, 'Nominee Name'),
                  SizedBox(height: 16.0),
                  _buildTextField(_nomineeAgeController, 'Nominee Age', keyboardType: TextInputType.number),
                  SizedBox(height: 16.0),
                  _buildTextField(_nomineeRelationController, 'Nominee Relation'),
                  SizedBox(height: 16.0,),
                  Row(
                    children: [
                      Icon(Icons.contact_phone, color: Colors.orange, size: 24.0),
                      SizedBox(width: 8.0),
                      Text(
                        'Contact Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 600 ? 18 : 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.0,),
                  Container(

                    width: 300.0, // Fixed width for mobile devices
                    child: DropdownButtonFormField<String>(
                      value: _selectedCountry,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCountry = newValue;
                        });
                      },

                      decoration: InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                      items: _countries.map((country) {
                        return DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 18.0),

                  DropdownButtonFormField<String>(
                    value: _selectedState,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedState = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder(),
                    ),
                    items: _states.map((state) {
                      return DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),

                  Container(
                    width: 300.0, // Fixed width for mobile devices
                    child: DropdownButtonFormField<String>(
                      value: _selectedDistrict,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedDistrict = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'District',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      ),
                      items: _districts.map((district) {
                        return DropdownMenuItem(
                          value: district,
                          child: Text(district),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  _buildTextField(_addressController, 'Address'),
                  SizedBox(height: 16.0),
                  _buildTextField(_cityNameController, 'City'),
                  SizedBox(height: 16.0),
                  _buildTextField(_pinCodeController, 'Pin Code', keyboardType: TextInputType.number),
                  SizedBox(height: 16.0),
                  _buildTextField(_emailController, 'Email', keyboardType: TextInputType.emailAddress),
                  SizedBox(height: 16.0),
                  _buildTextField(_mobileController, 'Mobile', keyboardType: TextInputType.number),
                  SizedBox(height: 16.0),
                  _buildTextField(_panNumberController, 'PAN Number', keyboardType: TextInputType.numberWithOptions(signed: true,decimal: true)),
                  SizedBox(height: 16.0),
                  _buildTextField(_aadharNumberController, 'Aadhaar Number', keyboardType: TextInputType.number),
                  SizedBox(height: 16.0),

                  Container(
                    color: Colors.black,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Bank Details Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_balance, color: Colors.orange, size: 24.0),
                      SizedBox(width: 8.0),
                      Text(
                        'Bank Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 600 ? 18 : 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(_bankNameController, 'Bank Name'),
                  SizedBox(height: 16.0),
                  _buildTextField(_accountTypeController, 'Account Type'),
                  SizedBox(height: 16.0),
                  _buildTextField(_accountHolderNameController, 'Account Holder Name'),
                  SizedBox(height: 16.0),
                  _buildTextField(_branchNameController, 'Branch Name'),
                  SizedBox(height: 16.0),
                  _buildTextField(_ifscCodeController, 'IFSC Code', keyboardType: TextInputType.number),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Terms and Conditions
            Row(
              children: [
                Checkbox(
                  value: _istermsAccepted,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _istermsAccepted = newValue ?? false;
                    });
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditions()));
                    },
                    child: Text(
                      "I accept the Terms and Conditions",
                      style: TextStyle(fontSize: 16,color: Colors.blue,decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _handleReset,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                          // Color of the button
                          // Color of the text
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0), // Rectangular shape
                          ),
                        ),
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              color: Colors.white), // Ensure text color is white
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    // Reduced space between checkbox and submit button
                    SizedBox(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: ElevatedButton(
                          onPressed: _istermsAccepted ? () {
                            // Handle form submission
                          } : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white), // Ensure text color is white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
