import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController studentNumberController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Text(
                  "Hello! Register to get started",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(nicknameController, "Nickname"),
                SizedBox(height: 10),
                _buildAgeField(),
                SizedBox(height: 10),
                _buildTextField(studentNumberController, "Student Number"),
                SizedBox(height: 10),
                _buildDepartmentField(),
                SizedBox(height: 10),
                _buildTextField(emailController, "Email"),
                SizedBox(height: 10),
                _buildTextField(passwordController, "Password", obscureText: true),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Registration logic can be added here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF586EFF),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  Widget _buildAgeField() {
    return TextFormField(
      controller: ageController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Age",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your age';
        }
        final age = int.tryParse(value);
        if (age == null || age < 0) {
          return 'Please enter a valid age';
        }
        return null;
      },
    );
  }

  Widget _buildDepartmentField() {
    return DropdownButtonFormField<String>(
      value: null,
      onChanged: (value) {
        departmentController.text = value ?? '';
      },
      items: [
        DropdownMenuItem(child: Text('ITE'), value: 'ITE'),
        DropdownMenuItem(child: Text('CICS'), value: 'CICS'),
        DropdownMenuItem(child: Text('CAHSS'), value: 'CAHSS'),
        DropdownMenuItem(child: Text('CET'), value: 'CET'),
      ],
      decoration: InputDecoration(
        labelText: "Select Department",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select your department';
        }
        return null;
      },
    );
  }
}
