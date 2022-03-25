import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'drawer_item.dart';


class DrawerItems {
  static const home = DrawerItem(title: "Home",icon: FontAwesomeIcons.home);
  static const explore = DrawerItem(title: "explore",icon: Icons.explore);
  static const favorites = DrawerItem(title: "favorites",icon: Icons.favorite_sharp);
  static const messages = DrawerItem(title: "messages",icon: Icons.mail);
  static const profile = DrawerItem(title: "profile",icon: FontAwesomeIcons.userAlt);
  static const settings  = DrawerItem(title: "settings",icon: Icons.settings);
  static const logout = DrawerItem(title: "logout",icon: Icons.logout);

  static final List<DrawerItem> all = [
    home,
    explore,
    favorites,
    messages,
    profile,
    settings,
    logout
  ];
}