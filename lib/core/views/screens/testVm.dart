import 'package:an_najah_project/core/data/alnjahAPI.dart';
import 'package:an_najah_project/core/model/course.dart';
import 'package:an_najah_project/core/view_model/courseVM.dart';
import 'package:an_najah_project/core/view_model/profileVM.dart';
import 'package:an_najah_project/core/view_model/userVM.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';

class Testvm extends StatefulWidget {


  @override
  State<Testvm> createState() => _TestvmState();
}

class _TestvmState extends State<Testvm> {


  UserVM userVM=UserVM();
  Course course=Course();
  ProfileVM profileVM=ProfileVM();
  @override
  void initState() {
    // TODO: implement initState


  }
  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async{
         String? token=await userVM.login(email: "mssal12380@gmail.com", password: "123");
        if(token!=null){ User respone=
        await userVM.getUserProfileFromLocalStorage();
        print("arbice name: "+respone.englishName.toString());
        await userVM.logout(token: token);
        print("arbice name: "+respone.englishName.toString());

        }
        else
          print("xxxxxxxxx") ;

          setState(() {

          });
        }),
        body: Center(
          child: Text("${course.courseName} ${course.fees}"),
        ),
      );
    }
    catch(x){
      print(x);
    }
    return Container();
  }
}
