
import 'package:an_najah_project/core/views/screens/diplomas_available.dart';
import 'package:an_najah_project/core/views/screens/profile_screen.dart';
import 'package:an_najah_project/core/views/screens/signup_screen.dart';
import 'package:an_najah_project/core/views/screens/login_screen.dart';



class RouteManager{
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/splash':return MaterialPageRoute(builder: (ctx)=>SplashScreen());
      case '/home':return MaterialPageRoute(builder: (ctx)=>HomeScreen());
      case '/corsdetals':return MaterialPageRoute(builder: (ctx)=>CorseDetalsSreen());
      case '/edtprofile':return MaterialPageRoute(builder: (ctx)=>EdtProfileScreen());
      case '/cors':return MaterialPageRoute(builder: (ctx)=>Cors_Screen());
      case '/login':return MaterialPageRoute(builder: (ctx)=>LoginScreen());
      case '/sinup':return MaterialPageRoute(builder: (ctx)=>SignupScreen());
      case '/default':return MaterialPageRoute(builder: (ctx)=>SplashScreen());

        
    }
  }
}
