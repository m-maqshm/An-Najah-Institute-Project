import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoarding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: OnBoardingSlider(
            headerBackgroundColor: Colors.white,
            // finishButtonText: 'Register',
            // finishButtonStyle: FinishButtonStyle(
            //   backgroundColor: Colors.black,
            // ),
            // skipTextButton: Text('Skip'),
            // trailing: Text('Login'),
            background: [
              Image.asset('assets/images/an_najaj_pic.jpg',width: 150,height: 150,),
              Image.asset('assets/images/an_najaj_pic.jpg',width: 150,height: 150),
            ],
            totalPage: 2,
            speed: 1.8,
            pageBodies: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text('Description Text 1'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text('Description Text 2'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}