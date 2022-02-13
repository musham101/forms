import 'package:flutter/material.dart';
import 'package:forms/logic/logical_classes.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Center(child: Text('Users List', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),)),
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
     body: const ListView(),
    );
  }
}

class ListView extends StatefulWidget {
  const ListView({ Key? key }) : super(key: key);

  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.amber,
        child: Column(
          children: [
            for(int s = 0; s < index; s++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Full Name: ' + fullNameArr[s] + ', Username: ' + userNameArr[s] + ', E-mail: ' + emailArr[s], style: const TextStyle(color: Colors.black87),),
            ),
          ],
        ),
      ),
    );
  }
}