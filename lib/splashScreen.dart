import 'package:flutter/material.dart';
import 'package:sportpal/Controller/IntroPage.dart';
import 'package:sportpal/Controller/chooseCategory.dart';
import 'package:shared_preferences/shared_preferences.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<bool> fetchedUser;
  late String route;


  Future<bool> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("email")) {
      route = "home2";
    } else {
      route = "signin";
    }

    return true;
  }

@override
  void initState() {
  fetchedUser = fetchUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (route == "home2") {
              return ChooseCategory();
            } else {
              return const Intropage();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
