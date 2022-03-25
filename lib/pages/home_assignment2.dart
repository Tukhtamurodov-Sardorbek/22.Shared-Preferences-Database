import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sharedpreferencesdb/models/singUp_model.dart';
import 'package:sharedpreferencesdb/services/pref_service.dart';

class HomeAssignmentTwo extends StatefulWidget {
  static const String id = '/home_assignment_2';
  const HomeAssignmentTwo({Key? key}) : super(key: key);

  @override
  State<HomeAssignmentTwo> createState() => _HomeAssignmentTwoState();
}

class _HomeAssignmentTwoState extends State<HomeAssignmentTwo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _store(){
    if(_nameController.text.isEmpty
        || _emailController.text.isEmpty
        || _phoneController.text.isEmpty
        || _passwordController.text.isEmpty
        || _confirmPasswordController.text.isEmpty
        || _passwordController.text != _confirmPasswordController.text
    ){
      return;
    }

    SignUp data = SignUp(email: _emailController.text, password: _passwordController.text, name: _nameController.text, phoneNumber: _phoneController.text);
    SharedPreferenceService.storeObject(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Let\'s Get Started!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), textAlign: TextAlign.center),
            const Text('Create an account of Q Allure to get all features', style: TextStyle(color: Colors.grey, fontSize: 15), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  hintText: 'Full name',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  )
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  )
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                  hintText: 'Phone',
                  prefixIcon: const Icon(Icons.smartphone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  )
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  )
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                  hintText: 'Confirm password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  )
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: MaterialButton(
                color: CupertinoColors.systemBlue,
                height: 50,
                minWidth: 180,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
                child: const Text('CREATE', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: _store,
              ),
            ),
            const SizedBox(height: 100),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Already have an account?',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                    TextSpan(
                        text: ' Sign In',
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.pop(context);
                        }
                    )
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
