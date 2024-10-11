import 'package:dio/dio.dart';

class ApiException{
  static handleException(DioException error){
    switch(error.type){
      case DioExceptionType.badResponse :{
        return " استعلام خاطئ ${error.message}";
      }
      case DioExceptionType.connectionTimeout :{
        return "يستغرق الخادم وقتًا طويلاً للاستجابة ${error.message}";
      }
      case DioExceptionType.receiveTimeout :{
        return "لم يتم على أي رد من الخادم ${error.message}";
      }
      default:{
        return "خطأ غير معروف، يرجى التحقق من اتصالك بالإنترنت والمحاولة لاحقاً";
      }

    }
  }
}