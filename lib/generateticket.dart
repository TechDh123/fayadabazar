import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class GenerateTicketForm extends StatefulWidget {
  const GenerateTicketForm({super.key});

  @override
  State<GenerateTicketForm> createState() => _GenerateTicketFormState();
}

class _GenerateTicketFormState extends State<GenerateTicketForm> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedDepartment;
  String? _selectedPriority;
  String _fileName = 'No File Chosen';

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Generate Ticket",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Department Dropdown
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        value: _selectedDepartment,
                        items: [
                          DropdownMenuItem<String>(
                            value: null,
                            child: Text(
                              'Select Department',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ...['Support', 'Sales', 'HR'].map((String department) {
                            return DropdownMenuItem(
                              value: department,
                              child: Text(department),
                            );
                          }).toList(),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedDepartment = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a department';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Name Field
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Subject Field
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter the subject',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a subject';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Message Field
                      const SizedBox(height: 8),
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Enter your message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        value: _selectedPriority,
                        items: [
                          DropdownMenuItem<String>(
                            value: null,
                            child: Text(
                              'Select Your Priority',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ...['High', 'Medium', 'Low'].map((String department) {
                            return DropdownMenuItem(
                              value: department,
                              child: Text(department),
                            );
                          }).toList(),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedPriority = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a Priority';
                          }
                          return null;
                        },
                      ),

                      // Priority Dropdown
                      // 
                      const SizedBox(height: 16),

                      // Attachment Section
                      const Text(
                        'Attachment',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.black, width: 2),
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles();
                              if (result != null) {
                                setState(() {
                                  _fileName = result.files.single.name ?? 'No File Chosen';
                                });
                              }
                            },
                            child: const Text('Choose File', style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _fileName,
                              style: const TextStyle(color: Colors.black54),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Note and Buttons
                      const Text(
                        'Note: Fields with * are mandatory fields.',
                        style: TextStyle(color: Colors.red,),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Handle form submission here
                              }
                            },
                            child: const Text('Submit',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () {
                              _formKey.currentState?.reset();
                              setState(() {
                                _selectedDepartment = null;
                                _selectedPriority = null;
                                _fileName = 'No File Chosen';
                              });
                            },
                            child: const Text('Reset',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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

void main() {
  runApp(const MaterialApp(home: GenerateTicketForm()));
}
