import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/http_helper.dart';
import '../constants/http_urls.dart';
import '../models/cerificat.dart';

class Cerificatvm with ChangeNotifier{
  Cerificatvm(){
    getCerificat();
  }
  HttpHelper http = HttpHelper.instance;
  List<Cerificat> cerificats = [];

  void getCerificat() async {

    try {
      Response res = await http.postRequest(
          url: HttpUrls.cerificat, data: FormData.fromMap(
          {'token': "0648dfec1d668847f1f8a85e65389119"}));
      cerificats = res.data['data'].map<Cerificat>((e) => Cerificat.fromJson(e)).toList();
      notifyListeners();
    }on DioException catch (x) {
      print('dio  $x');
    }
    catch (x) {
      print(" error= $x");
    }
  }
}