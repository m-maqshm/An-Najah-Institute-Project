import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    home();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(' '),
        Text('An Najah '),
          SizedBox(height: 30,),
          Center(child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
  home(){
    Future.delayed(Duration(seconds: 3),(){

      Navigator.pushNamedAndRemoveUntil(context, "/home",(route)=>false);
    });
  }

  }

