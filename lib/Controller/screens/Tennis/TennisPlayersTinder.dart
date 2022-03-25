import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/home2/MenuWidget.dart';
import 'package:sportpal/Controller/screens/profil/components/bottomNavBar.dart';
import 'package:sportpal/Model/User.dart';
import 'TinderCard.dart';

class TennisPlayerTinderScreen extends StatefulWidget {
  const TennisPlayerTinderScreen({Key? key}) : super(key: key);

  @override
  _TennisPlayerTinderScreenState createState() => _TennisPlayerTinderScreenState();
}

class _TennisPlayerTinderScreenState extends State<TennisPlayerTinderScreen> {
  final user = User(
    "623c730677c023d8e7b621f1","saif","aaa@a.c","dddd","22",
      "http://res.cloudinary.com/dy05x9auh/image/upload/v1648128777/jugetmdkfynzkogan3hn.jpg",
      true,[23,24],"27","miboun","complexé"
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepOrangeAccent,Colors.black]
        )
      ),
      child: Scaffold(

        bottomNavigationBar: BottomNavBarV2(),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                buildLogo(),
                SizedBox(height:16),
                Expanded(child: GestureDetector(
                  onPanStart: (details){
                    //final provider = Provider?.of<CardProvider>(context,listen: true);
                    //provider.startPosition(details);
                  },
                  onPanUpdate: (details){
                    //final provider = Provider?.of<CardProvider>(context,listen: true);
                    //provider.updatePosition(details);
                  },
                  onPanEnd: (details){
                    //final provider = Provider?.of<CardProvider>(context,listen: true);
                    //provider.endPosition();
                  },
                    child: Draggable(
                        child: TinderCard(user:user),
                      feedback: Material(
                        type: MaterialType.transparency,
                      ),
                    ))),
                buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  buildFrontCard()=>GestureDetector(

  );
  buildLogo() => Row(
    children: [
      Icon(
        Icons.sports_cricket,
        color: Colors.white,
        size: 36,
      ),
      const SizedBox(width: 4,),
      Text("SportPal",style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        fontFamily: 'Productsans',
        color: Colors.white
      ),)
    ],
  );

  buildButtons() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
          onPressed: (){},
          child: Icon(Icons.clear,color: Colors.red,size: 20,)),
      ElevatedButton(
          onPressed: (){},
          child: Icon(Icons.star,color: Colors.blue,size: 20,)),
      ElevatedButton(
          onPressed: (){},
          child: Icon(FontAwesomeIcons.heart,color: Colors.teal,size: 20,)),
    ],
  );

}


