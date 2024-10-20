import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _sponsorIdController = TextEditingController();
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmpasswordVisible = false;
  bool _rememberMe = false;
  bool _isLoading = false;

  String? _verificationId;

  @override
  void dispose() {
    _sponsorIdController.dispose();
    _memberIdController.dispose();
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Member ID (Email)';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    if (!value.endsWith('@gmail.com')) {
      return 'Please use a Gmail address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length != 10 || !RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    // else if (!RegExp(
    //     r'^(?=.?[a-z])(?=.?[A-Z])(?=.?[0-9])(?=.?[!@#$%^&*()_+={};:<>|./?,-]).{8,}$').hasMatch(value)) {
    //   return "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character";
    // }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (!_rememberMe) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please check Remember Me to proceed')),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      try {
        // Create user
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _memberIdController.text.trim(),
          password: _passwordController.text,
        );

        String uid = userCredential.user!.uid;

        // Save user info to Firestore
        await FirebaseFirestore.instance.collection('UserLogin').doc(uid).set({
          'sponsorId': _sponsorIdController.text.trim(),
          'memberId': _memberIdController.text.trim(),
          'fullName': _fullNameController.text.trim(),
          'phoneNumber': _phoneNumberController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Start phone verification
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91${_phoneNumberController.text.trim()}',
          timeout: const Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) async {
            await userCredential.user!.updatePhoneNumber(credential);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Phone number verified successfully')),
            );
            // Navigate to next screen
          },
          verificationFailed: (FirebaseAuthException e) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Phone verification failed: ${e.message}')),
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            setState(() {
              _isLoading = false;
              _verificationId = verificationId; // Store verification ID
            });
            // Navigate to OTP screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(verificationId: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            setState(() {
              _isLoading = false;
            });
          },
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'An error occurred';
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'This email is already in use.';
            break;
          case 'weak-password':
            errorMessage = 'The password is too weak.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is invalid.';
            break;
          default:
            errorMessage = 'An unexpected error occurred: ${e.message}';
            break;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred: $e')),
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: deviceHeight * 0.02),
                  Center(
                    child: Text(
                      "Create an Account",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: deviceWidth * 0.07,
                      ),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  _buildTextField(
                    controller: _sponsorIdController,
                    labelText: "Enter Your Sponsor ID",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Sponsor ID';
                      }
                      return null;
                    },
                  ),
                  _buildTextField(
                    controller: _memberIdController,
                    labelText: "Enter Your Member ID (Email)",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  _buildTextField(
                    controller: _fullNameController,
                    labelText: "Enter Your Full Name",
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  _buildTextField(
                    controller: _phoneNumberController,
                    labelText: "Enter Your Phone Number",
                    prefixIcon: Icons.phone_android,
                    keyboardType: TextInputType.phone,
                    validator: _validatePhoneNumber,
                  ),
                  _buildPasswordField(
                    controller: _passwordController,
                    labelText: "Enter Your Password",
                    validator: _validatePassword,
                  ),
                  _buildPasswordField(
                    controller: _confirmPasswordController,
                    labelText: "Enter Your Confirm Password",
                    validator: _validateConfirmPassword,
                    isConfirm: true,
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        activeColor: Colors.orange,
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (_rememberMe && !_isLoading) ? _submitForm : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (_rememberMe && !_isLoading) ? Colors.blue : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Sign Up", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?", style: TextStyle(fontStyle: FontStyle.italic)),
                        TextButton(
                          onPressed: () {
                            // Navigate to login page
                          },
                          child: const Text("Sign in", style: TextStyle(color: Colors.orange)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    IconData? prefixIcon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.orange) : null,
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
    bool isConfirm = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isConfirm ? !_confirmpasswordVisible : !_passwordVisible,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: const Icon(Icons.lock_outline_rounded, color: Colors.orange),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: Icon(isConfirm
                ? (_confirmpasswordVisible ? Icons.visibility_off : Icons.visibility)
                : (_passwordVisible ? Icons.visibility_off : Icons.visibility)),
            color: Colors.orange,
            onPressed: () {
              setState(() {
                if (isConfirm) {
                  _confirmpasswordVisible = !_confirmpasswordVisible;
                } else {
                  _passwordVisible = !_passwordVisible;
                }
              });
            },
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class OtpScreen extends StatelessWidget {
  final String verificationId;

  const OtpScreen({required this.verificationId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Enter OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(labelText: "OTP"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: _otpController.text.trim(),
                  );
                  await FirebaseAuth.instance.signInWithCredential(credential);
                  // Navigate to home or next screen
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Invalid OTP")),
                  );
                }
              },
              child: const Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
