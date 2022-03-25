import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/User.dart';

class UserService{

  final String _baseUrl = "10.0.2.2:3000";


  Future<String?> CreateAccount(firstname,email,password,telnum,gender,type,String? filepath,birthdate) async {
    var request = http.MultipartRequest('POST',Uri.http(_baseUrl,"/player"));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (password != null) {
      request.fields['password'] = password;
      request.fields['telNum'] = telnum;
      request.fields['gender'] = gender;

      request.fields['birthDate'] = birthdate;
    }
    request.fields['fullName'] = firstname;
    request.fields['email'] =email ;

    if (filepath != null) {
      request.files.add(await http.MultipartFile.fromPath('picture', filepath));
    }
    print(request.fields);
    var response = await request.send();
    final responseData = await response.stream.toBytes();
    final responseString = String.fromCharCodes(responseData);
    Map<String, dynamic> user = await jsonDecode(responseString);
    if (response.statusCode == 201){
      User u = User.fromJson(user['user']);

      Map<String,dynamic> test = u.toMap();
      print(test);
      test.forEach((key, value) {
        print(key);
        print(value);
        if(value == false || value == true){

          prefs.setBool(key, value);
        }else if (value is List){
          value.forEach((element) {
            prefs.setString("longtitude", element);
            prefs.setString("laltitude", element);
          });
        }else if (value != null){

          prefs.setString(key, value);
        }else{
          prefs.setString(key, "");
        }
      });
      return await Future(() => "created");
    }else if (response.statusCode == 401){
      return await Future(() => "duplicated");
    }
    return response.reasonPhrase;
  }

  Future<String> login(Map<String,dynamic> user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.post(Uri.http(_baseUrl, "/user/login"), headers: headers, body: json.encode(user))
        .then((http.Response response) async {
      Map<String, dynamic> userData = await  json.decode(response.body);
      if(response.statusCode == 200) {
        prefs.setString("token", userData["token"]);
        User u = User.fromJson(userData["user"]);
        Map<String,dynamic> test = u.toMap();
        test.forEach((key, value) {
          if(value == false || value == true){
            prefs.setBool(key, value);
          }else if (value is List){
            value.forEach((element) {
              prefs.setString("longtitude", element);
              prefs.setString("laltitude", element);
            });
          }else if (value != null){
            prefs.setString(key, value);
          }else{
            prefs.setString(key, "");
          }
        });
        return await new Future(() => "good");
      }else if(response.statusCode == 401) {
        print(response.body);
        return await new Future(() => "pass");}

    }

    );
    return test!;

  }

  Future<dynamic> CheckMail(String email) async {
    Map<String, dynamic> userData = {
      "email": email
    };
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.post(Uri.http(_baseUrl, "/user/checkMail"), headers: headers, body: json.encode(userData))
        .then((http.Response response) async {
      Map<String, dynamic> userData = await  json.decode(response.body);
      print(response.body);
      if(response.statusCode == 200) {
        return await Future(() => userData['reponse']);
      }
      else if(response.statusCode == 203) {
        print(response.body);
        return await Future(() => "good");
      }
    }

    );
    return test!;

  }

  Future<String> forgotPass(Map<String,String> email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.post(Uri.http(_baseUrl, "/user/forgotPassword"), headers: headers, body: json.encode(email))
        .then((http.Response response) async {
      Map<String, dynamic> userData = await  json.decode(response.body);
      if(response.statusCode == 200) {
        return await new Future(() => userData["token"]);
      }
      else if(response.statusCode == 403)
        return await new Future(() => userData["token"]);
      else
        return await new Future(() => "no user");
    });
    return test;

  }

  Future<String?> ResetPassword(Map<String,String> pass,String email,String token) async {

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.post(Uri.http(_baseUrl, "/user/resetPassword/"+email+"/"+token), headers: headers, body: json.encode(pass))
        .then((http.Response response) async {
      Map<String, dynamic> userData = await  json.decode(response.body);
      if(response.statusCode == 200) {

        return await Future(() => "modified");
      }
      else if(response.statusCode == 400) {
        return await  Future(() => "token expired");
      } else if(response.statusCode == 401) {
        return await  Future(() => "no user");
      }
    });

    return  test;

  }


}