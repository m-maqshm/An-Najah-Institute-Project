import 'package:an_najah_project/core/view_models/profileVM.dart';
import 'package:an_najah_project/core/views/widget/appbar_widget.dart';
import 'package:an_najah_project/core/views/widget/list_titel_widget.dart';
import 'package:an_najah_project/helpers/storage_helper.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
 ProfileScreen({super.key});
  StorageHelper storageHelper=StorageHelper.instance;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
ProfileVM profileVM=ProfileVM();
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidget(),
        backgroundColor: Color.fromRGBO(145, 139, 199, 1),
        floatingActionButton: Container(
          height: height*.06,
          width: width*.3,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color:  Color.fromRGBO(2, 0, 21, 0.34),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.edit , color: Colors.white,),
              ),
              Text("edite" , style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  radius: 70,
                  child: Icon(
                    Icons.person,
                    size: height * 0.15,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child:storageHelper.readKey("email")!=null?Text(storageHelper.readKey("email").toString() , style: TextStyle(color: Colors.white)): const Text("examble@gmail.com" , style: TextStyle(color: Colors.white),),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                //  height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(2, 0, 21, 0.34),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ListTitelWidget(
                      property: "arabic name: ",
                      value: storageHelper.readKey("arabicName"),
                    ),
                    ListTitelWidget(
                      property: "address : ",
                      value: storageHelper.readKey('address'),
                    ),
                    ListTitelWidget(
                      property: "phone No: ",
                      value: storageHelper.readKey('phoneNumber'),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white60,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(159, 154, 208, 4)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      ListTitelWidget(
                        property: "Name : ",
                        value: storageHelper.readKey('englishName'),
                      ),
                      ListTitelWidget(
                        property: "ID Number : ",
                        value: storageHelper.readKey('Id-card'),
                      ),
                      // ListTitelWidget(
                      //   property: "The Governorate : ",
                      //   value: "Hadramoute",
                      // ),
                      ListTitelWidget(
                        property: "Educational Qualification : ",
                        value: storageHelper.readKey('academicQualification')                      ),
                      ListTitelWidget(
                        property: "Day of Birth : ",
                        value: storageHelper.readKey("dateOfBirth"),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
