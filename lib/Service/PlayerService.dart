
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/User.dart';

import '../Model/News.dart';
import '../main.dart';

class PlayerService{

  final String _baseUrl = "10.0.2.2:3000";


  Future<String?> updateProfilPlayer(fullname, email, age, telnum, filepath, id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var request = http.MultipartRequest('PATCH', Uri.http(_baseUrl, "/player/" + id));

    if (fullname.toString().isNotEmpty) {
      request.fields['fullName'] = fullname;
    }
    if (email.toString().isNotEmpty) {
      request.fields['email'] = email;
    }
    if (age.toString().isNotEmpty) {
      request.fields['birthDate'] = age;
    }
    if (telnum.toString().isNotEmpty) {
      request.fields['telNum'] = telnum;
    }
    if (filepath != null) {
      request.files.add(await http.MultipartFile.fromPath('picture', filepath));
    }
    var res = await request.send();
    var responsed = await http.Response.fromStream(res);
    final userData = json.decode(responsed.body);
    print(userData);
    if (res.statusCode == 200) {
      User u = User.fromJson(userData["user"]);

      Map<String, dynamic> test = u.toMap();
      test.forEach((String key, dynamic value) {
        print(key);
        print(value);
        if (value == false || value == true) {
          prefs.setBool(key, value);
        }else if (value is List){
          value.forEach((element) {
            prefs.setString("longtitude", element);
            prefs.setString("laltitude", element);
          });
        }
        else if (value != null) {
            prefs.setString(key, value);
        } else {
          prefs.setString(key, "");
        }
      });

      return await Future(() => "updated");
    } else if (res.statusCode == 400) {
      return await Future(() => "error");
    }
    return res.reasonPhrase;
  }




}