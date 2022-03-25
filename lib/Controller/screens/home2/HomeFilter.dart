import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Controller/chooseCategory.dart';
import 'package:sportpal/Controller/screens/Tennis/TennisFilter.dart';
import 'package:sportpal/Controller/screens/tournement/createTournement.dart';
import '../../authentification/signIn.dart';
import '../onBoarding/AboutUsScreen.dart';
import '../onBoarding/termsAndConditions.dart';
import '../profil/profilScreen.dart';
import 'MenuPage.dart';

class HomePageFilter extends StatefulWidget {
  const HomePageFilter({Key? key}) : super(key: key);

  @override
  _HomePageFilterState createState() => _HomePageFilterState();
}

class _HomePageFilterState extends State<HomePageFilter> {
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
        return TennisFilter();
      case MenuItems.notifications:
        return CreateTournementScreen();
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
        prefs?.remove("address");
        return SignIn();
      default:
        return TennisFilter();
    }
  }
}
