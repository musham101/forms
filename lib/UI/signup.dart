import 'package:flutter/material.dart';
import 'package:forms/logic/logical_classes.dart';
import 'package:forms/UI/signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

User obj = User();
String tempPassword = '';

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: Text(
                  'Enter your name',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                }
                return null;
              },
              onChanged: (name) {
                setState(() {
                  obj.setName(name);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: Text(
                  'Enter a username',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                }
                return null;
              },
              onChanged: (username) {
                setState(() {
                  obj.setUsername(username);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: Text(
                  'Enter your email',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                }
                return null;
              },
              onChanged: (email) {
                setState(() {
                  obj.setEmail(email);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: Text(
                  'Enter your password',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                }
                return null;
              },
              onChanged: (password) {
                setState(() {
                  tempPassword = password;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: Text(
                  'Enter your password',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                } else if (value == tempPassword) {
                  return null;
                }
                return 'Passwords donot match';
              },
              onChanged: (password) {
                setState(() {
                  obj.setPassword(password);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    if (obj.submit() == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form Submitted')),
                      );
                    }
                  });
                }
              },
              child: const Text('Submit',
                  style: TextStyle(color: Colors.white70, fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'if you have an account already, click on',
                  style: TextStyle(color: Colors.black87),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInUI()),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black87),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
