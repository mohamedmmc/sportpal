import 'package:flutter/material.dart';




class MenuItem{
  final String title;
  final IconData icon;
  const MenuItem(this.title,this.icon);
}

class MenuItems{
  static const profil = MenuItem("Profil", Icons.account_box_outlined);
  static const sport = MenuItem("Change sport", Icons.sports_baseball);
  static const notifications = MenuItem("Notifications", Icons.notifications);
  static const payment = MenuItem("Payment", Icons.payment);
  static const AboutUs = MenuItem("About us", Icons.article);
  static const TermsAndConditions = MenuItem("Terms of Service", Icons.article_outlined);
  static const Logout = MenuItem("Log out", Icons.logout);






  static const all = <MenuItem>[
    profil,payment,notifications,sport,AboutUs,TermsAndConditions
  ];

}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage({Key? key, required this.currentItem, required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              ...MenuItems.all.map(buildMenuItem).toList(),
              Divider(color: Colors.white70,),
              SizedBox(height: 40,),
              Spacer(flex: 1,),
              ListTile(
                selectedTileColor: Colors.black26,
                selected: currentItem == MenuItems.Logout,
                minLeadingWidth: 20,
                leading: Icon(MenuItems.Logout.icon),
                title: Text(MenuItems.Logout.title),
                onTap: () {
                  onSelectedItem(MenuItems.Logout);
                },
              ),

            ],
          ),
        ),

      ),
    );
  }
  buildHeader(BuildContext context)=>Container(
    color: Colors.blue,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 52,
          backgroundImage: AssetImage("assets/images/saif.jpg"),
        ),
        SizedBox(height: 12,),
        Text(
          "Seif Gouider"
        )
      ],
    ),
  );
  buildMenuItem(MenuItem item) {
    return ListTileTheme(
      selectedColor: Colors.white,
      child: ListTile(
        selectedTileColor: Colors.black26,
        selected: currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(item.title),
        onTap: () {
          onSelectedItem(item);
        },
      ),
    );
  }
}
