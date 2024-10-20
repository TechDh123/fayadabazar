import 'package:flutter/material.dart';

class SWalletToSWallet extends StatefulWidget {
  const SWalletToSWallet({super.key});

  @override
  State<SWalletToSWallet> createState() => _SWalletToSWalletState();
}

class _SWalletToSWalletState extends State<SWalletToSWallet> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to manage text inputs
  final TextEditingController memberIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController narrationController = TextEditingController();

  // Predefined current balance
  final double currentWalletBalance = 123.20;

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use LayoutBuilder to detect the screen width and height
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          return SingleChildScrollView( // Allow scrolling when content overflows
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? constraints.maxWidth * 0.2 : 16.0,
                vertical: 16.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "S-Wallet To S-Wallet",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        // In landscape mode, use two TextFields side by side
                        if (isLandscape)
                          Expanded(
                            child: TextFormField(
                              controller: memberIdController,
                              decoration: const InputDecoration(
                                labelText: 'Member ID *',
                                border: OutlineInputBorder(),
                                isDense: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Member ID';
                                }
                                return null;
                              },
                            ),
                          ),
                        if (isLandscape) const SizedBox(width: 16.0),
                        if (isLandscape)
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Current Wallet Balance',
                                border: const OutlineInputBorder(),
                                isDense: true,
                              ),
                              initialValue: currentWalletBalance.toString(),
                              enabled: false,
                            ),
                          ),
                      ],
                    ),
                    if (!isLandscape)
                      Column(
                        children: [
                          TextFormField(
                            controller: memberIdController,
                            decoration: const InputDecoration(
                              labelText: 'Member ID *',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Member ID';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Current Wallet Balance',
                              border: const OutlineInputBorder(),
                              isDense: true,
                            ),
                            initialValue: currentWalletBalance.toString(),
                            enabled: false,
                          ),
                        ],
                      ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Amount *',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the amount';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: narrationController,
                      decoration: const InputDecoration(
                        labelText: 'Narration *',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a narration';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Note: Fields with * are mandatory.',
                      style: TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Change button color to blue
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Process the data
                              print('Submit button pressed');
                              print('Member ID: ${memberIdController.text}');
                              print('Amount: ${amountController.text}');
                              print('Narration: ${narrationController.text}');
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            // Reset the form and clear all input fields
                            _formKey.currentState!.reset();
                            memberIdController.clear();
                            amountController.clear();
                            narrationController.clear();
                          },
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
