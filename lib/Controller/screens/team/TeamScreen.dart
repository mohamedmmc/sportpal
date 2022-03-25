import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/home2/MenuWidget.dart';
import 'package:sportpal/Controller/screens/profil/aboutMe/aboutMeScreen.dart';
import 'package:sportpal/Controller/screens/profil/components/bottomNavBar.dart';

import '../../../constants.dart';


class FootBallTeam extends StatefulWidget {
  const FootBallTeam({Key? key}) : super(key: key);


  @override
  _FootBallTeamState createState() => _FootBallTeamState();
}

class Constants {
  static const String Requests = "Join requests ";
  static const String Quit = "Leave team ";
  static const String Cancel = "Cancel";
  static const List<String> choices = <String>[Requests, Quit, Cancel];
}

class _FootBallTeamState extends State<FootBallTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarV2(),
      appBar: AppBar(
        leading: MenuWidget(),

        backgroundColor: Colors.lightGreen[600],
        title: Center(
          child: Text(
            "My team",
            style: TextStyle(
                fontSize: appBarTitleSize, fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chat),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    _getAvatar(),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Esprit",
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(FontAwesomeIcons.cog),
                      onSelected: choiceAction,
                      itemBuilder: (BuildContext context) {
                        return Constants.choices.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  //border: TableBorder.all(),
                  columns: [
                    DataColumn(
                      label: Text("Picture"),
                    ),
                    DataColumn(label: Text("name")),
                    DataColumn(label: Text("Age"), numeric: true),
                    DataColumn(label: Text("Post")),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.crown,
                            size: 15,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                border:
                                    Border.all(color: Colors.blue, width: 1.2),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/saif.jpg"))),
                          ),
                        ],
                      ),
                          onTap: (){}
                          ),
                      DataCell(Text(
                        "Saif",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue),
                      ),onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMeScreen()));
                      }),
                      DataCell(
                        Text(
                          "23",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue),
                        ),
                      ),
                      DataCell(Text(
                        "Defense",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.user,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                border:
                                    Border.all(color: Colors.blue, width: 1.2),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Hbib.jpg"))),
                          ),
                        ],
                      )),
                      DataCell(Text("Hbib")),
                      DataCell(Text("25")),
                      DataCell(Text("Attack")),
                    ]),
                    DataRow(cells: [
                      DataCell(Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.user,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                border:
                                    Border.all(color: Colors.blue, width: 1.2),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Malek.jpg"))),
                          ),
                        ],
                      )),
                      DataCell(Text("Malek")),
                      DataCell(Text("29")),
                      DataCell(Text("Center")),
                    ]),
                    DataRow(cells: [
                      DataCell(Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.user,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                border:
                                    Border.all(color: Colors.blue, width: 1.2),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Monam.jpg"))),
                          ),
                        ],
                      )),
                      DataCell(Text("Monam")),
                      DataCell(Text("24")),
                      DataCell(Text("Attack")),
                    ]),
                    DataRow(cells: [
                      DataCell(Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.user,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                border:
                                    Border.all(color: Colors.blue, width: 1.2),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Ghazi.jpg"))),
                          ),
                        ],
                      )),
                      DataCell(Text("Ghazi")),
                      DataCell(Text("25")),
                      DataCell(Text("Defense")),
                    ]),
                    DataRow(cells: [
                      DataCell(Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.user,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                border:
                                    Border.all(color: Colors.blue, width: 1.2),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Hamza.jpg"))),
                          ),
                        ],
                      )),
                      DataCell(Text("Hamza")),
                      DataCell(Text("23")),
                      DataCell(Text("Goal Keeper")),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "History",
                    style: TextStyle(
                        color: Colors.lightGreen[600],
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Colors.blue, width: 1.2),
                            image: DecorationImage(
                                image: AssetImage("assets/images/esprit.jpg"))),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "3 - 1 ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Colors.blue, width: 1.2),
                            image: DecorationImage(
                                image: AssetImage("assets/images/Tekup.png"))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Colors.blue, width: 1.2),
                            image: DecorationImage(
                                image: AssetImage("assets/images/esprit.jpg"))),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "2 - 1 ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Colors.blue, width: 1.2),
                            image: DecorationImage(
                                image: AssetImage("assets/images/Sesame.png"))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Check more ",
                      style: TextStyle(fontWeight: FontWeight.w200)),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    //TODO sign in with email and password
                  },
                  child: Container(
                    height: 60,
                    width: 320,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.lightGreen[600]),
                    child: Center(
                      child: Text(
                        "Challenge",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.blue, width: 1.2),
          image:
              DecorationImage(image: AssetImage("assets/images/esprit.jpg"))),
    );
  }

  void choiceAction(String choice) {
    print("Working");
  }
}
