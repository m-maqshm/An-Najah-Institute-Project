import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/http_helper.dart';
import '../../helpers/storage_helper.dart';
import '../constants/http_urls.dart';
import '../models/cerificat.dart';

class Cerificatvm with ChangeNotifier{
  static StorageHelper storageHelper = StorageHelper.instance;

  Cerificatvm(){
    getCerificat();
  }
  HttpHelper http = HttpHelper.instance;
  List<Cerificat> cerificats = [];

  void getCerificat() async {

    try {
      Response res = await http.postRequest(
          url: HttpUrls.cerificat, data: FormData.fromMap(
          {'token': "${storageHelper.readKey('token').toString()}"}));
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