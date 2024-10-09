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
        children: [Image.asset('assets/images/alnajah.png'),
        Text('معهد النجاح للتدريب والاستشارات بالقطن برحب بكم ' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          Center(child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
  home(){
    Future.delayed(Duration(seconds: 3),(){

      Navigator.pushNamedAndRemoveUntil(context, "/diplom",(route)=>false);
    });
  }

  }

