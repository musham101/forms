import 'package:flutter/material.dart';
import 'package:forms/logic/logical_classes.dart';

class SignInUI extends StatelessWidget {
  const SignInUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Center(
            child: Text(
          'Sign In Page',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                  'Enter your Username or Email',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                }
                else if(index <= 0){
                  return 'No users exist in the backlog';
                }
                else{
                  for(int s = 0; s < index; s++){
                    if(value == userNameArr[s] || value == emailArr[s]){
                      return null;
                    }
                  }
                  return 'Invalid username/email';
                }
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
                  'Enter your Password',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                }
                else if(index <= 0){
                  return 'No users exist in the backlog';
                }
                else{
                  for(int s = 0; s < index; s++){
                    if(value == passwordArr[s]){
                      return null;
                    }
                  }
                  return 'Invalid Password';
                }
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Log In Successful')),
                      );
                  });
                }
              },
              child: const Text('Log in',
                  style: TextStyle(color: Colors.white70, fontSize: 20)),
            ),
          ),
        ],
      )
    );
  }
}