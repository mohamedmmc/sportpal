import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sportpal/Controller/screens/profil/profilScreen.dart';
import 'package:sportpal/Service/PlayerService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home2/HomeProfil.dart';


class EditProfilePage extends StatefulWidget {

  const EditProfilePage({Key? key, required this.email, required this.telNum, required this.age, required this.profilePic, required this.fullName, required this.id}) : super(key: key);
  final String email;
  final String id;
  final String telNum;
  final String fullName;
  final String age;
  final String profilePic;
  @override
  _EditProfilePageState createState() => _EditProfilePageState();

}

class _EditProfilePageState extends State<EditProfilePage> {
  DateTime birthDate = DateTime.now();

  late SharedPreferences prefs;
  late Future<bool> fetchedUser;
  late String fullName;
  late String id;
  late String email;
  late String telNum;
  late String age;
  late String profilePic;

  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();

    fullName = prefs.getString("fullName")!;
    email = prefs.getString("email")!;
    telNum = prefs.getString("telNum")!;
    id = prefs.getString("_id")!;
    age = prefs.getString("birthDate")!;
    profilePic = prefs.getString("profilePic")!;

    return true;
  }

  XFile? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if(image == null) return;
    final imageTemporary =  XFile(image.path);
    setState(() {
      this.image=imageTemporary;
    });
  }
  TextEditingController fullNameTE= new TextEditingController();
  TextEditingController emailTE= new TextEditingController();
  TextEditingController telNumTE= new TextEditingController();
  TextEditingController ageTE= new TextEditingController();
  late String Semail;
  late String StelNum;
  late String SfullName;
  late String Sage;
  late String SprofilePic;

  @override
  void initState() {
    fetchedUser = fetchUser();
    birthDate = DateTime.parse(widget.age);
    super.initState();
  }
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Edit",style: TextStyle(
            color: Colors.green
        ),),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilScreen()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    InkWell(
                      onTap:(){
                        setState(() {

                          pickImage(ImageSource.camera);
                        });

                      },
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: widget.profilePic.isEmpty ? AssetImage('assets/images/athlete.png') :true ? NetworkImage(widget.profilePic) : const AssetImage('assets/images/background.png') as ImageProvider,

                            )
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField(fullNameTE,"Full Name", widget.fullName, false),
              buildTextField(emailTE,"E-mail", widget.email, false),
              buildTextField(telNumTE,"Phone number", widget.telNum, false),
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  setState(() {

                    _selectDate(context);

                  });
                },

                child: Text("Change your Birthday"),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pop(context);
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilScreen()));
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () async{

                      Semail = emailTE.text;
                      Sage = ageTE.text;
                      SfullName = fullNameTE.text;
                      StelNum = telNumTE.text;
                      var birthdate = DateFormat("yyyy-MM-dd").format(birthDate);
                      var update = await PlayerService().updateProfilPlayer(SfullName, Semail, birthdate, StelNum, image?.path, widget.id);
                      print(update);
                      if (update == "updated"){
                        setState(() {
                          fetchedUser =  fetchUser();
                        });
                        //Navigator.pop(context);
                        //Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageProfil()));
                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Information"),
                              content: Text("Error has occured !"),
                            );
                          },
                        );
                      }

                      // var test = await PlayerService().updateProfilPlayer(userData, widget.id);
                      // if (test == "pass"){
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return const AlertDialog(
                      //         title: Text("Information"),
                      //         content: Text("Incorrect password !"),
                      //       );
                      //     },
                      //   );
                      // }

                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller,String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller:controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 15,
              fontFamily: "Cardo",
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != birthDate) {
      setState(() {
        birthDate = selected;
      });
    }
  }
}
