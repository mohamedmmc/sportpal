import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sportpal/Controller/screens/profil/profilScreen.dart';
import 'package:sportpal/Model/News.dart';
import 'package:sportpal/Service/NewsService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/constants.dart';

import '../../IntroPage.dart';
import '../profil/components/bottomNavBar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}


class _NewsPageState extends State<NewsPage> {

  bool  isFootballTrue = false;
  bool  isTennisTrue = false;
  bool  isBasketballTrue = false;
  bool  isAllTrue = true;
  final List<News> _news = [];
  late Future<bool> fetchedNews;

  @override
  void initState() {
    fetchedNews =  NewsService().getNews(_news);
    print(fetchedNews);
    super.initState();
  }
  Future<void> _ButtoncolorFoot() async {
    setState(() {
      isFootballTrue=true;
      isTennisTrue=false;
      isBasketballTrue=false;
      isAllTrue=false;
    });
  }
  Future<void> _ButtoncolorBasket() async {
    setState(() {
      isFootballTrue=false;
      isTennisTrue=false;
      isBasketballTrue=true;
      isAllTrue=false;
    });
  }
  Future<void> _ButtoncolorTennis() async {
    setState(() {
      isFootballTrue=false;
      isTennisTrue=true;
      isBasketballTrue=false;
      isAllTrue=false;
    });
  }
  Future<void> _ButtoncolorAll() async {
    setState(() {
      isFootballTrue=false;
      isTennisTrue=false;
      isBasketballTrue=false;
      isAllTrue=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
      ),

      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text("News", style: TextStyle(color: Colors.grey[80],
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 2.5,
                          child: GestureDetector(
                            onTap: (){
                              _ButtoncolorAll();
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: isAllTrue ? Colors.yellow[700] : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Align(
                                child: Text(
                                  'All', style: TextStyle(
                                  color: isAllTrue ? Colors.white : Colors.grey[700],
                                  fontSize: 18,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        AspectRatio(
                          aspectRatio: 2.5,
                          child: GestureDetector(
                            onTap: (){
                              _ButtoncolorFoot();
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: isFootballTrue ? Colors.yellow[700] : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Align(
                                child: Text(
                                  'Football', style: TextStyle(
                                  color: isFootballTrue ? Colors.white : Colors.grey[700],
                                  fontSize: 18,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        AspectRatio(
                          aspectRatio: 2.5,
                          child: GestureDetector(
                            onTap: (){
                              _ButtoncolorTennis();
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: isTennisTrue ? Colors.yellow[700] : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Align(
                                child: Text(
                                  'Tennis', style: TextStyle(
                                  color: isTennisTrue ? Colors.white : Colors.grey[700],
                                  fontSize: 18,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        AspectRatio(
                          aspectRatio: 2.5,
                          child: GestureDetector(
                            onTap: (){
                              _ButtoncolorBasket();
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: isBasketballTrue ? Colors.yellow[700] : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Align(
                                child: Text(
                                  'Basketball', style: TextStyle(
                                  color: isBasketballTrue ? Colors.white : Colors.grey[700],
                                  fontSize: 18,
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('keep updated', style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FutureBuilder(

                  future: fetchedNews ,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if(snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return _makeItem(image: _news[index].imageURL!,subtitle: _news[index].title!.substring(0,5)+"...",title: _news[index].title!.substring(0,5)+"...");
                          }
                      );
                    }
                    else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 30,),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: fetchedNews,
                        builder:
                            (BuildContext context, AsyncSnapshot<bool> snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                SizedBox(height: 20,),
                                Container(
                                  height: double.maxFinite,
                                  child: SingleChildScrollView(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        itemBuilder: (BuildContext context, int index) {
                                          return _makeItem2(
                                              image: _news[index+3].imageURL!,
                                              subtitle: _news[index+3].desc!.substring(0, 35) +
                                                  "..." ,
                                              title: _news[index+3].title!.substring(0, 20) +
                                                  "...");
                                        }),
                                  ),
                                ),
                                SizedBox(height: 5,),
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),

                    ],
                  ),
                )),


          ],
        ),

      ),
      bottomNavigationBar: BottomNavBarV2(),
    );
  }Widget _makeItem({required String image, required String title, required String subtitle}) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        onTap: (){
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: true ? NetworkImage(image) : AssetImage('assets/images/footnews1.png') as ImageProvider,
              fit: BoxFit.cover,

            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    stops: [.2,.9],
                    colors: [
                      Colors.black.withOpacity(.1),
                      Colors.black.withOpacity(.3)
                    ]
                )
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite,color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,style: TextStyle(color:Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(subtitle,style: TextStyle(color:Colors.white,fontSize: 18),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _makeItem2(
      {required String image,
        required String title,
        required String subtitle}) {
    return ListTile(
      leading:Container(
        width: 90,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(0)),
            border: Border.all(color: Colors.blue, width: 1.2),
            image:
            DecorationImage(image: NetworkImage(image))),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.menu),
      isThreeLine: true,
      dense: true,
      onTap: () {},
    );
  }

}