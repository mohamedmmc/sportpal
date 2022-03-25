import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportpal/constants.dart';
import 'dart:io';





class FootConstants {
  static const int num1 = 10;
  static const int num2 = 12;
  static const int num3 = 14;
  static const int num4 = 16;

  static const List<int> choices = <int> [num1,num2,num3,num4];
}

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({Key? key}) : super(key: key);

  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {


  bool img=false;
  int? numberOfPlayers = 10;
  bool isTrue = true;
  XFile? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if(image == null) return;
    final imageTemporary =  XFile(image.path);
    setState(() {
      this.image=imageTemporary;
    });
  }


  @override
  void choiceAction(int choice){
    setState(() {
      numberOfPlayers = choice;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        centerTitle: true,
        title: Text("Create your team",style: TextStyle(fontWeight: FontWeight.bold,fontSize: appBarTitleSize),),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 16),
                    child: Container(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color.fromRGBO(49, 39, 79, 1),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: image == null
                              ? null
                              : FileImage(File(image!.path)),
                        ),
                      ),
                    ),),
                  InkWell(
                    onTap: (){
                      setState(() {
                        pickImage(ImageSource.gallery);
                      });
                    },
                    child: Text(
                      "click here to insert your team logo",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.blue[500]),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 1))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                            )),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Enter team name",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "About us ",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 1))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                            )),
                        child: TextField(
                          minLines: 5,
                          maxLines: 9,
                          decoration: InputDecoration(
                              hintText: "Enter a quick description here ",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 120,),
              InkWell(
                onTap: (){
                  //TODO team creation
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:34.0),
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.futbol,color: Colors.blue[500],),
                        Container(
                          height: 50,
                          width: 200,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue[500]),
                          child: Center(
                            child: Text(
                              "Create",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Icon(FontAwesomeIcons.futbol,color: Colors.blue[500],),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
