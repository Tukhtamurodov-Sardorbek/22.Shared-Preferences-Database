import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferencesdb/models/singUp_model.dart';
import 'package:sharedpreferencesdb/models/user_model.dart';

enum StorageKeys{
  DATA
}

class SharedPreferenceService{
  static String _getKey(StorageKeys key){
    switch(key){
      case StorageKeys.DATA: return 'Data';
    }
  }

  /// For a single String
  // #store String => data
  static void storeData(StorageKeys key, String data) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_getKey(key), data);
  }
  // #get String => data
  static Future<String?> getData(StorageKeys key) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(_getKey(key));
  }
  // #remove String => data
  static Future<bool> remove(StorageKeys key) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(_getKey(key));
  }

  /// For an object
  // #store Object => user
  static void storeUser(User user) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    pref.setString('user', stringUser);
  }
  // #get Object => user
  static Future<User?> getUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if(stringUser == null || stringUser.isEmpty){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }
  // #remove Object => user
  static Future<bool> removeUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove('user');
  }

  /// For a list
  static Future<bool> storeList(List<User> list) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> stringList = list.map((e) => jsonEncode(e.toJson())).toList();
    return await pref.setStringList('userList', stringList);
  }
  static Future<List<User>?> loadList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<User>? objectsList =  pref.getStringList("userList")?.map((stringList) => User.fromJson(jsonDecode(stringList))).toList();
    // List<String>? stringList = pref.getStringList('userList');
    // List mapList = stringList!.map((string) => jsonDecode(string)).toList();
    // List<User> userList = mapList.map((json) => User.fromJson(json)).toList();
    return objectsList;
  }

///////////////////////////////////////////////////////////////////////////////
  /// For an object
  // #store Object => user
  static void storeObject(SignUp user) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    print('STORE: $stringUser');
    pref.setString('object', stringUser);
  }
  // #get Object => user
  static Future<SignUp?> getObject() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('object');
    if(stringUser == null || stringUser.isEmpty){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringUser);
    return SignUp.fromJson(map);
  }
  // #remove Object => user
  static Future<bool> removeObject() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove('object');
  }

}