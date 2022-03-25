import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Controller/chooseCategory.dart';
import 'package:sportpal/Controller/screens/Tennis/TennisFilter.dart';
import '../../authentification/signIn.dart';
import '../onBoarding/AboutUsScreen.dart';
import '../onBoarding/termsAndConditions.dart';
import '../profil/profilScreen.dart';
import 'MenuPage.dart';

class HomePageProfil extends StatefulWidget {
  const HomePageProfil({Key? key}) : super(key: key);

  @override
  _HomePageProfilState createState() => _HomePageProfilState();
}

class _HomePageProfilState extends State<HomePageProfil> {
  MenuItem currentItem = MenuItems.payment;
  SharedPreferences? prefs;
  Future<bool> fetchPrefs() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }
  @override
  void initState() {
    fetchPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ZoomDrawer(
      style: DrawerStyle.Style1,
      showShadow: true,
      shadowLayer1Color: Colors.blue,
      shadowLayer2Color: Colors.orange,
      borderRadius: 40,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
                ZoomDrawer.of(context)!.close();
              });
            }),
      ));

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.profil:
        return ProfilScreen();
      case MenuItems.payment:
        return ProfilScreen();
      case MenuItems.notifications:
        return ProfilScreen();
      case MenuItems.sport:
        return ChooseCategory();
      case MenuItems.AboutUs:
        return AboutUsScreen();
      case MenuItems.TermsAndConditions:
        return TermsAndConditions();
      case MenuItems.Logout:
        prefs?.remove("_id");
        prefs?.remove("birthDate");
        prefs?.remove("password");
        prefs?.remove("telNum");
        prefs?.remove("isVerified");
        prefs?.remove("gender");
        prefs?.remove("type");
        prefs?.remove("email");
        prefs?.remove("fullName");
        prefs?.remove("token");
        return SignIn();
      default:
        return ProfilScreen();
    }
  }
}
