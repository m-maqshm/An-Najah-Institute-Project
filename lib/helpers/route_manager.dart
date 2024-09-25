
import 'package:an_najah_project/core/views/screens/corse_detals_screen.dart';
import 'package:an_najah_project/core/views/screens/home_screen.dart';
import 'package:an_najah_project/core/views/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';

import '../core/views/screens/login_screen.dart';
import '../core/views/screens/signup_screen.dart';

class RouteManager{
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/splash':return MaterialPageRoute(builder: (ctx)=>SplashScreen());
      case '/home':return MaterialPageRoute(builder: (ctx)=>HomeScreen());
      case '/corsdetals':return MaterialPageRoute(builder: (ctx)=>CorseDetalsSreen());
      case '/login':return MaterialPageRoute(builder: (ctx)=>LoginScreen());
      case '/sinup':return MaterialPageRoute(builder: (ctx)=>SignupScreen());
      case '/default':return MaterialPageRoute(builder: (ctx)=>SplashScreen());
    }
  }
}