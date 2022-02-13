import 'package:flutter/material.dart';
import 'UI/view_users.dart';
import 'UI/signup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forms',
      home: SignUpUI(),
    );
  }
}

class SignUpUI extends StatelessWidget {
  const SignUpUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Center(
            child: Text(
          'Sign Up Page',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        )),
        leading: IconButton(
          icon: const Icon(
            Icons.people_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UsersListPage()),
            );
          },
        ),
      ),
      body: const SignUpPage(),
    );
  }
}
