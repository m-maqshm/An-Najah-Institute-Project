// import 'package:get_storage/get_storage.dart';

// class StorageHelper{
//   StorageHelper._();
//   static StorageHelper? sHelper;

//   static StorageHelper get instance{
//     if(sHelper==null)
//       sHelper=StorageHelper._();
//     return sHelper!;
//   }

//   GetStorage box=GetStorage();

//   readKey(String key){
//   return box.read(key);
//   }
//   writeKey(String key,String value){
// box.write(key, value);
//   }
//   removeKey(String key){
//     box.remove(key);
//   }
//   removeAll(){
//     box.erase();
//   }
// }