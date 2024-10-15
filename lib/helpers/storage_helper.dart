
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class StorageHelper with ChangeNotifier{
  StorageHelper._();
  static StorageHelper? sHelper;
StorageHelper(){
  
}
  static StorageHelper get instance{
    if(sHelper==null)
      sHelper=StorageHelper._();
    return sHelper!;
  }

   GetStorage box=GetStorage();

   readKey(String key){
    return box.read(key);
          notifyListeners();
  }
  writeKey(String key,dynamic value){
    box.write(key, value);
  }
  removeKey(String key){
    box.remove(key);
  }
  removeAll(){
    box.erase();
  }
}

