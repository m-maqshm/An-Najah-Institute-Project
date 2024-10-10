import 'package:dio/dio.dart';

import '../../helpers/http_helper.dart';
import '../constant/http_urls.dart';
import '../models/cors.dart';

class Corsvm {
  Future<List<Cours>? > getCours ( )async{
    try{
      HttpHelper http=HttpHelper.instance;


      Response res=await http.getRequest(url: HttpUrls.allcorses );
      List<Cours>? allCourse = res.data?.map<Cours>((e)=>Cours.fromJson(e)).toList();



      return allCourse;
    }on DioException catch(x){
      print(x);

    }
    catch(e){
      print("exception is ${e}");
      // return e.toString();
    }
  }

}