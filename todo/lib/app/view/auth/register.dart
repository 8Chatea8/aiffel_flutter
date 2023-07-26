import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late FirebaseAuth auth;
  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;
  late TextEditingController _userNameController;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    _emailcontroller = TextEditingController();
    _userNameController = TextEditingController();
    _passwordcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailcontroller,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordcontroller,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                registerWithEmail(
                    auth,
                    _emailcontroller.text,
                    _passwordcontroller.text,
                    _userNameController.text,
                    context);
              },
              child: Text('Registor'),
            ),
          ],
        ),
      ),
    );
  }
}
