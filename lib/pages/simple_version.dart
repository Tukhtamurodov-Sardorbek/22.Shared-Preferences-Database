import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleVersion extends StatefulWidget {
  static const String id = '/simple_version';
  const SimpleVersion({Key? key}) : super(key: key);

  @override
  State<SimpleVersion> createState() => _SimpleVersionState();
}

class _SimpleVersionState extends State<SimpleVersion> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFocus = FocusNode();
  String data = '';

  // #store String
  void _storeData(String data) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('data', data);
    _textController.clear();
    _textFocus.unfocus();
  }
  // #get String
  Future<String?> _getData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('data');
  }
  // #remove String
  Future<bool> remove() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove('data');
  }
  // #display the stored data
  void assign(String localData){
    setState(() {
      data = localData;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
    _textFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(' Simple Shared Preference'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              focusNode: _textFocus,
              style: const TextStyle(fontSize: 20),
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Data',
                labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: CupertinoColors.systemGreen,
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Text('Store', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    _storeData(_textController.text);
                  },
                ),
                MaterialButton(
                  color: CupertinoColors.systemYellow,
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Text('Get', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    _getData().then((value) => {
                      assign(value??'No data')
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
                    remove();
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
