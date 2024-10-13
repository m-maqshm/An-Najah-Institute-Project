import 'package:an_najah_project/core/models/cors.dart';
import 'package:an_najah_project/core/views/screens/about_the_institute.dart';
import 'package:an_najah_project/core/views/screens/app_developers.dart';
import 'package:an_najah_project/core/views/screens/corse_detals_screen.dart';

import 'package:an_najah_project/core/views/screens/cours_screen.dart';
import 'package:an_najah_project/core/views/screens/diplomas_available.dart';

import 'package:an_najah_project/core/views/screens/preCerificat_screen.dart';
import 'package:an_najah_project/core/views/screens/precourses.dart';

import 'package:an_najah_project/core/views/screens/profile_screen.dart';

import 'package:an_najah_project/core/views/screens/login_screen.dart';
import 'package:an_najah_project/core/views/screens/signup_screen.dart';
import 'package:an_najah_project/core/views/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';

// import '../core/views/screens/cours_screen.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (ctx) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (ctx) => SignupScreen());
      case '/diplom':
        return MaterialPageRoute(builder: (ctx) => DiplomasAvailable());
      case '/profile':
        return MaterialPageRoute(builder: (ctx) => ProfileScreen());
      case '/coursDetals':
        Cours cours = settings.arguments as Cours;
        return MaterialPageRoute(builder: (ctx) => CorseDetalsSreen(c: cours));
      case '/courses':
        return MaterialPageRoute(builder: (ctx) => CorsScreen());

      case '/pre':
        return MaterialPageRoute(builder: (ctx) => PreCertificates());
      case '/preCourse':
        return MaterialPageRoute(builder: (ctx) => PreCourses());
      case '/devlopers':
        return MaterialPageRoute(builder: (ctx) => AppDevelopers());
      case '/about':
        return MaterialPageRoute(builder: (ctx) => AboutTheInstitute());

      case '/default':
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
    }
    return null;
  }
}
