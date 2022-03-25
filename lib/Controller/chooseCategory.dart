import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/home2/HomeProfil.dart';



class ChooseCategory extends StatefulWidget {
  const ChooseCategory({Key? key}) : super(key: key);

  @override
  _ChooseCategoryState createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "pick a sport",
          style: TextStyle(
            fontSize: 20
          ),

        ),
      ),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageProfil()));
            },
            child: Container(
              height: 350,
              width: 1200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                      AssetImage("assets/images/foot.jpg"),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.bottomRight,colors: [
                      Colors.black.withOpacity(.3),
                      Colors.black.withOpacity(.7)
                    ])
                ),
                //    decoration: BoxDecoration(
                //    gradient: LinearGradient(begin: Alignment.bottomRight,colors: [
                //    Colors.black.withOpacity(.5),
                //  Colors.black.withOpacity(.6)
                //])
                //),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Football",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
          ),


          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageProfil()));
            },
            child: Container(
              height: 350,
              width: 1500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/tennis.jpg"),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.bottomRight,colors: [
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(.7)
                    ])
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Tennis",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),

            ),
          )
        ],
      ),
    );
  }
}
