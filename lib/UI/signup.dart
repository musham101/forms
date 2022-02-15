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
  bool _passwordVisible1 = true;
  bool _passwordVisible2 = true;
  void _passwordHandler1(){
    setState(() {
      _passwordVisible1 = !_passwordVisible1;
    });
  }
  void _passwordHandler2(){
    setState(() {
      _passwordVisible2 = !_passwordVisible2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Name Feild
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
          // Username Feild
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
          // Email Feild
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
          // Password Feild
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: _passwordVisible1,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    _passwordHandler1();
                  }, 
                  icon: const Icon(Icons.visibility),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: const Text(
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
          // Password confirm Feild
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: _passwordVisible2,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    _passwordHandler2();
                  }, 
                  icon: const Icon(Icons.visibility),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: const Text(
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
          // Submit Button
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
