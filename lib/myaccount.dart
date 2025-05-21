import 'package:flutter/material.dart';
import 'custom.dart';
import 'dumydata.dart';
import 'login.dart'; 

class Myaccount extends StatefulWidget {
  const Myaccount({super.key});

  @override
  State<Myaccount> createState() => _MyaccountState();
}

class _MyaccountState extends State<Myaccount> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _educationStatusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData(); 
  }

  void _loadUserData() {
    final user = DummyData.users.firstWhere(
      (u) => u['id'] == userid,
      orElse: () => {
        'username': '',
        'email': '',
        'country': '',
        'age': 0,
        'university': '',
        'rank': 0,
      }, 
    );

    _usernameController.text = user['username'];
    _emailController.text = user['email'];
    _countryController.text = user['country'];
    _ageController.text = user['age'].toString();
    _universityController.text = user['university'];
    _educationStatusController.text = user['rank'].toString();
  }

  void _saveChanges() {
    final index = DummyData.users.indexWhere((u) => u['id'] == userid);
    if (index != -1) {
      setState(() {
        DummyData.users[index] = {
          'id': userid,
          'username': _usernameController.text,
          'email': _emailController.text,
          'country': _countryController.text,
          'age': _ageController.text, 
          'university': _universityController.text,
          'rank': _educationStatusController.text,
        };
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _ageController.dispose();
    _universityController.dispose();
    _educationStatusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      endDrawer: CustomDrawer(),
      backgroundColor: const Color(0xFFEBFCFD),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'My Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('Username', _usernameController),
              _buildTextField('Email', _emailController),
              _buildTextField('Country', _countryController),
              _buildTextField('Age', _ageController),
              _buildTextField('University', _universityController),
              _buildTextField('Education Status', _educationStatusController),
              const SizedBox(height: 20),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Changes Saved Successfully!'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF094546), 
                    padding: const EdgeInsets.symmetric(vertical: 16), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'Enter your $label',
            ),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
