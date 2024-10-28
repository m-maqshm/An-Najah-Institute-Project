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
      body: Container(
        color:  Color.fromARGB(255, 129, 128, 182),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Image.asset('assets/images/alnajah.png'),
          SizedBox(height: 30,),
          Text('معهد النجاح للتدريب والتـأهيل ', style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "shorog",
          ),),
            SizedBox(height: 30,),
            Center(child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
  home(){
    Future.delayed(Duration(seconds: 3),(){

      Navigator.pushNamedAndRemoveUntil(context, "/diplom",(route)=>false);
    });
  }

  }

