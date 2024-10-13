import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class imgeProfile extends StatefulWidget {
  const imgeProfile({super.key});

  @override
  State<imgeProfile> createState() => _imgeProfileState();
}

class _imgeProfileState extends State<imgeProfile> {
  String? path;

  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap:(){
        showDialog(context: context, builder: (ctx){
          return AlertDialog(content:SizedBox(
            width: width*0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () async {
                  path=await pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                  setState(() {
                  });
                }, icon: Icon(Icons.photo_camera_back,color: Colors.blue,)),
                IconButton(onPressed: () async {
                  path=await pickImage(ImageSource.camera);
                  Navigator.pop(context);
                  setState(() {
                  });

                }, icon: Icon(Icons.camera_alt_rounded,color: Colors.blue,)),
              ],
            ),
          ) ,);

        });
      },
      child: Container(
        width: width*0.5,
        height: height*0.2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
            border: Border.all(color: Colors.blueAccent),
            image: DecorationImage(
              

                image:path==null? AssetImage("assets/images/user_icon.png",):FileImage(File(path!),),
                fit: BoxFit.cover),
           
            color: Colors.white),
      ),
    );
  }

  Future<String?> pickImage(ImageSource source) async {
    ImagePicker _picker=ImagePicker( );
    XFile? image=await _picker.pickImage(source:source );
    return image?.path;
  }
}
