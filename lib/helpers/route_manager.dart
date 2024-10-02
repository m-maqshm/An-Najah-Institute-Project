import 'package:an_najah_project/core/views/screens/diplomas_available.dart';
import 'package:an_najah_project/core/views/screens/profile_screen.dart';
import 'package:an_najah_project/core/views/screens/signup_screen.dart';
import 'package:an_najah_project/core/views/screens/login_screen.dart';

import 'package:an_najah_project/core/views/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (ctx) => LoginScreen());
      case '/sing':
        return MaterialPageRoute(builder: (ctx) => SignupScreen());
      case '/diplom':
        return MaterialPageRoute(builder: (ctx) => DiplomasAvailable());
      case '/profile':
        return MaterialPageRoute(builder: (ctx) => ProfileScreen());

      case '/default':
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
    }
    return null;
  }
}
