import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sharedpreferencesdb/models/singUp_model.dart';
import 'package:sharedpreferencesdb/pages/home_assignment2.dart';
import 'package:sharedpreferencesdb/services/pref_service.dart';

class HomeAssignmentOne extends StatefulWidget {
  static const String id = '/home_assignment_1';
  const HomeAssignmentOne({Key? key}) : super(key: key);

  @override
  State<HomeAssignmentOne> createState() => _HomeAssignmentOneState();
}

class _HomeAssignmentOneState extends State<HomeAssignmentOne> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _check(){
    if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
      return;
    }
    SharedPreferenceService.getObject().then((value) => assign(value??SignUp(email: 'No data', password: 'No data', name: 'No data', phoneNumber: 'No data')));
  }

  void assign(SignUp data){
    if(data.email == _emailController.text.toString().trim() && data.password == _passwordController.text.toString().trim()){
      if (kDebugMode) {
        print('Success');
      }
    }else{
      if (kDebugMode) {
        print('Fail');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/img.png',
              height: 240,
              width: 240,
            ),
            const Text('Welcome back!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), textAlign: TextAlign.center),
            const Text('Log in to your existant account of Q Allure', style: TextStyle(color: Colors.grey, fontSize: 15), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
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
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
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
            ),
            const SizedBox(height: 10),
            const Text('Forgot Password?', textAlign: TextAlign.end, style: TextStyle(fontSize: 15)),
            const SizedBox(height: 10),
            Center(
              child: MaterialButton(
                color: CupertinoColors.systemBlue,
                height: 50,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: const Text('LOG IN', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: _check,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Or connect using', style: TextStyle(color: Colors.grey, fontSize: 15), textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: CupertinoColors.systemBlue,
                  height: 36,
                  minWidth: 130,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.facebook, color: Colors.white, size: 24),
                      SizedBox(width: 4),
                      Text('Facebook', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  onPressed: (){},
                ),
                MaterialButton(
                  color: Colors.redAccent,
                  height: 36,
                  minWidth: 130,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/google_icon.png',
                        height: 17,
                        width: 17,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      const Text('Google', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  onPressed: (){},
                ),
              ],
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Don\'t have an account?',
                style: const TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(
                    text: ' Sign Up',
                    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15),
                    recognizer: TapGestureRecognizer()..onTap = (){
                      Navigator.pushNamed(context, HomeAssignmentTwo.id);
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
