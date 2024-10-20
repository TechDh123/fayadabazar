import 'package:flutter/material.dart';

class EWalletToSWallet extends StatefulWidget {
  const EWalletToSWallet({super.key});

  @override
  State<EWalletToSWallet> createState() => _EWalletToSWalletState();
}

class _EWalletToSWalletState extends State<EWalletToSWallet> {
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
        elevation: 0, // Remove shadow under the app bar for a cleaner look
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
      backgroundColor: Colors.grey[100], // Light background color for better contrast
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? constraints.maxWidth * 0.2 : 16.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "E-Wallet To S-Wallet",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.deepPurple, // Consistent use of theme color
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (isLandscape)
                                  Expanded(
                                    child: TextFormField(
                                      controller: memberIdController,
                                      decoration: InputDecoration(
                                        labelText: 'Member ID *',
                                        prefixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
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
                                        prefixIcon: Icon(Icons.account_balance_wallet),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
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
                                    decoration: InputDecoration(
                                      labelText: 'Member ID *',
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
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
                                      prefixIcon: Icon(Icons.account_balance_wallet),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
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
                              decoration: InputDecoration(
                                labelText: 'Amount *',
                                prefixIcon: Icon(Icons.attach_money),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                              decoration: InputDecoration(
                                labelText: 'Narration *',
                                prefixIcon: Icon(Icons.notes),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 24,
                                    ),
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 24,
                                    ),
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
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
                ],
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
