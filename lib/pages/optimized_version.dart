import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharedpreferencesdb/models/user_model.dart';
import 'package:sharedpreferencesdb/services/pref_service.dart';

class OptimizedVersion extends StatefulWidget {
  static const String id = '/optimized_version';
  const OptimizedVersion({Key? key}) : super(key: key);

  @override
  State<OptimizedVersion> createState() => _OptimizedVersionState();
}

class _OptimizedVersionState extends State<OptimizedVersion> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  String data = '';
  bool isHidden = false;

  void store(){
    if(_nameController.text.isEmpty || _passwordController.text.isEmpty || _emailController.text.isEmpty){
      return;
    }
    User user = User(id: _nameController.text.hashCode.toString(), name: _nameController.text.toString().trim(), password: _passwordController.text.toString().trim(), email: _emailController.text.toString().trim());
    SharedPreferenceService.storeUser(user);
    _nameFocus.unfocus();
    _passwordFocus.unfocus();
    _emailFocus.unfocus();
  }

  void get(User user){
    setState(() {
      data = 'Name:  ${user.name} \nPassword:  ${user.password} \nEmail:  ${user.email}';
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameFocus.dispose();
    _passwordFocus.dispose();
    _emailFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(' Optimized Shared Preference'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: TextField(
                controller: _nameController,
                focusNode: _nameFocus,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: TextField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                obscureText: isHidden,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        isHidden = !isHidden;
                      });},
                    icon: Icon(isHidden?Icons.visibility_off_outlined:Icons.visibility_outlined),
                    splashRadius: 1,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: TextField(
                controller: _emailController,
                focusNode: _emailFocus,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: CupertinoColors.systemRed,
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Text('Store', style: TextStyle(fontSize: 20)),
                  onPressed: store,
                ),
                MaterialButton(
                  color: CupertinoColors.systemGreen,
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Text('Get', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    SharedPreferenceService.getUser().then((user) => {
                      get(user??User(id: 'No data', name: 'No data', password: 'No data', email: 'No data'))
                    });
                  },
                ),
                MaterialButton(
                  color: CupertinoColors.systemRed,
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Text('Delete', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    SharedPreferenceService.removeUser();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: Colors.black,
                child: RichText(
                  text: TextSpan(
                      text: 'Last Data',
                      style: const TextStyle(color: CupertinoColors.systemGreen, fontWeight: FontWeight.bold, fontSize: 18),
                      children: [
                        TextSpan(
                          text: '\n\n$data',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ]
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
