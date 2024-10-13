
import 'package:flutter/material.dart';

import 'package:an_najah_project/core/views/screens/cours_screen.dart';
import 'package:an_najah_project/core/views/screens/corse_detals_screen.dart';
import 'package:an_najah_project/core/views/screens/spalsh_screen.dart';
import 'package:an_najah_project/helpers/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../core/models/cors.dart';
import '../core/views/screens/about_the_institute.dart';
import '../core/views/screens/app_developers.dart';
import '../core/views/screens/diplomas_available.dart';
import '../core/views/screens/edt_profile_screen.dart';
import '../core/views/screens/login_screen.dart';
import '../core/views/screens/preCerificat_screen.dart';
import '../core/views/screens/precourses.dart';
import '../core/views/screens/profile_screen.dart';
import '../core/views/screens/signup_screen.dart';

class RouteManager{
 static StorageHelper storageHelper = StorageHelper.instance;
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/splash':return MaterialPageRoute(builder: (ctx)=>SplashScreen());
      case '/corsdetals':{
        Cours cours = settings.arguments as Cours;
        return MaterialPageRoute(builder: (ctx)=>CorseDetalsSreen(c: cours,));
      }
      case '/diplom':
        return MaterialPageRoute(builder: (ctx) => DiplomasAvailable());
      case '/precours':
        if (storageHelper.readKey('token')==null){
          Fluttertoast.showToast(
              msg: "لايمكنك الوصول الى هذه الصفحة تأكد من تسجيل الدخول ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 4,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          MaterialPageRoute(builder: (context) =>LoginScreen());
        } else
          return MaterialPageRoute(builder: (ctx) => PreCourses());


      case '/preCertificates':if (storageHelper.readKey('token')==null){
        Fluttertoast.showToast(
            msg: "لايمكنك الوصول الى هذه الصفحة تأكد من تسجيل الدخول ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
   return  MaterialPageRoute(builder: (context) =>LoginScreen());
      } else
        return MaterialPageRoute(builder: (ctx)=>PreCertificates());

      case '/edtprofile':if (storageHelper.readKey('token')==null){
        Fluttertoast.showToast(
            msg: "لايمكنك الوصول الى هذه الصفحة تأكد من تسجيل الدخول ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        return  MaterialPageRoute(builder: (context) =>LoginScreen());
      } else return MaterialPageRoute(builder: (ctx)=>EdtProfileScreen());
      case '/profile':if (storageHelper.readKey('token')==null){
        Fluttertoast.showToast(
            msg: "لايمكنك الوصول الى هذه الصفحة تأكد من تسجيل الدخول ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        return  MaterialPageRoute(builder: (context) =>LoginScreen());
      } else return MaterialPageRoute(builder: (ctx)=>ProfileScreen());
      case '/cours':return MaterialPageRoute(builder: (ctx)=>CorsScreen());
      case '/login':return MaterialPageRoute(builder: (ctx)=>LoginScreen());
      case '/signup':return MaterialPageRoute(builder: (ctx)=>SignupScreen());
      case '/default':return MaterialPageRoute(builder: (ctx)=>SplashScreen());
      case '/devlopers':
        return MaterialPageRoute(builder: (ctx) => AppDevelopers());
      case '/about':
        return MaterialPageRoute(builder: (ctx) => AboutTheInstitute());

        
    }
  }
}
