import 'package:sportpal/Controller/IntroPage.dart';
import 'package:sportpal/Controller/screens/news/News.dart';
import 'package:sportpal/Controller/screens/news/news.dart';
import 'package:sportpal/Controller/screens/profil/profilScreen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Intropage>(() => Intropage());
    register<ProfilScreen>(() => ProfilScreen());
    register<ProfilScreen>(() => ProfilScreen());
  }

  static dynamic fromString(String type) {
    if (_constructors[type] != null) return _constructors[type]!();
  }
}