import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/profil/aboutMe/aboutMeScreen.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyBody extends StatefulWidget {
  const MyBody({Key? key, required this.Fullname, required this.email, required this.telNum, this.age, required this.profilPic}) : super(key: key);
  final String Fullname;
  final String email;
  final String telNum;
  final String? age;
  final String profilPic;

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {


  DateTime ageNow = DateTime.now();


  @override
  void initState() {

    if(widget.age!=null){
      ageNow = DateTime.parse(widget.age!);
    }
    super.initState();
    print(DateTime.now().year - ageNow.year);
    print(DateTime.now().year );
    print( ageNow.year);

  }
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: defaultSize! * 24,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: CustomShape(),
                    child:
                        Container(height: defaultSize * 15, color: kPrimaryColor),
                  ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: defaultSize * 14,
                      width: defaultSize * 14,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white, width: defaultSize * 0.8),
                          image: DecorationImage(
                              image: widget.profilPic.isEmpty ? AssetImage('assets/images/athlete.png') :true ? NetworkImage(widget.profilPic) : const AssetImage('assets/images/background.png') as ImageProvider,
                              //true ? NetworkImage(widget.profilPic) : AssetImage('assets/images/background.png') as ImageProvider,
                              fit: BoxFit.cover)),
                    ),
                    Text (
                      widget.Fullname,
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, color: kTextColor),
                    ),
                    SizedBox(height: defaultSize / 2),
                    Text(

                      "Age : "+(DateTime.now().year - ageNow.year).toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8492A2),
                      ),
                    )
                  ],
                ),
              ),
                      ],
                    ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMeScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultSize * 2, vertical: defaultSize*3
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/bookmark_fill.svg"),
                    SizedBox(width: defaultSize * 2,),
                    Text(
                      "About me",
                      style: TextStyle(
                          fontSize: defaultSize * 1.6,
                          color: kTextLigntColor
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                      size: defaultSize*1.6,
                      color: kTextLigntColor,)


                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultSize * 2, vertical: defaultSize*3
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/bookmark_fill.svg"),
                    SizedBox(width: defaultSize * 2,),
                    Text(
                      "Missions",
                      style: TextStyle(
                        fontSize: defaultSize * 1.6,
                        color: kTextLigntColor
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                    size: defaultSize*1.6,
                    color: kTextLigntColor,)


                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultSize * 2, vertical: defaultSize*3
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/bookmark_fill.svg"),
                    SizedBox(width: defaultSize * 2,),
                    Text(
                      "Trophies",
                      style: TextStyle(
                          fontSize: defaultSize * 1.6,
                          color: kTextLigntColor
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                      size: defaultSize*1.6,
                      color: kTextLigntColor,)


                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultSize * 2, vertical: defaultSize*3
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/bookmark_fill.svg"),
                    SizedBox(width: defaultSize * 2,),
                    Text(
                      "get your professional card",
                      style: TextStyle(
                          fontSize: defaultSize * 1.6,
                          color: kTextLigntColor
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                      size: defaultSize*1.6,
                      color: kTextLigntColor,)


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
