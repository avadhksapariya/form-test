import 'package:flutter/material.dart';
import 'package:form_test/screen_home.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController tcUserName = TextEditingController();
  final TextEditingController tcPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    tcUserName.dispose();
    tcPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), foregroundColor: Colors.white, backgroundColor: Colors.blue),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20.0,
            children: [
              TextFormField(controller: tcUserName, decoration: const InputDecoration(labelText: 'User Name')),
              TextFormField(controller: tcPassword, decoration: const InputDecoration(labelText: 'Password')),
              ElevatedButton(onPressed: login, child: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (tcUserName.text == 'username' && tcPassword.text == 'password') {
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScreenHome()));
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text('Invalid Username or Password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
