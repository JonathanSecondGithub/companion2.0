import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _yearOfStudyController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final String username = _usernameController.text.trim();
      final String password = _passwordController.text.trim();
      final String name = _nameController.text.trim();
      final String studentId = _studentIdController.text.trim();
      final String course = _courseController.text.trim();
      final int yearOfStudy = int.tryParse(_yearOfStudyController.text) ?? 0;
      final int semester = int.tryParse(_semesterController.text) ?? 0;

      try {
        final response = await http.post(
          Uri.parse(
              'http://127.0.0.1:8000/api/register/'), // Update with your Django URL
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': username,
            'password': password,
            'name': name,
            'student_id': studentId,
            'course': course,
            'year_of_study': yearOfStudy,
            'semester': semester,
          }),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration successful! Please login.')),
          );
          Navigator.pop(context);
        } else {
          final data = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Registration failed')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred. Please try again.')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('📚', style: TextStyle(fontSize: 80)),
                SizedBox(height: 20),
                Text(
                  'Jkuat Companion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                _buildTextField(_usernameController, 'Username'),
                _buildPasswordField(_passwordController, 'Password'),
                _buildPasswordField(
                    _confirmPasswordController, 'Confirm Password'),
                _buildTextField(_nameController, 'Name'),
                _buildTextField(_studentIdController, 'Student ID'),
                _buildTextField(_courseController, 'Course'),
                _buildNumberField(_yearOfStudyController, 'Year of Study'),
                _buildNumberField(_semesterController, 'Semester'),
                SizedBox(height: 40),
                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: _register,
                      ),
                SizedBox(height: 20),
                TextButton(
                  child: Text('Already have an account? Login'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white54),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $hint';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String hint) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white54),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          validator: (value) {
            if (hint == 'Confirm Password' &&
                value != _passwordController.text) {
              return 'Passwords do not match';
            }
            if (value == null || value.isEmpty) {
              return 'Please enter $hint';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildNumberField(TextEditingController controller, String hint) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white54),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $hint';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
