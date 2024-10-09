import 'package:an_najah_project/core/view_models/corsvm.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CorsScreen extends StatelessWidget {
  CorsScreen({super.key});
  Corsvm cvm = Corsvm();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            
            Container(
              color: const Color.fromARGB(255, 129, 128, 182),
              height: height, // استخدام ارتفاع الشاشة الكامل
              alignment: Alignment.topCenter,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 129, 128, 182),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/p1.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
                top: 180,
                child: Container(
                    padding: EdgeInsets.all(7),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.14,
                    color: Color.fromARGB(63, 187, 173, 255),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10 , bottom: 10),
                      child: Text(
                        'دبلوم الحاسب الالي ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'cairo.ttf',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ))),
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // اللون الأبيض للحاوية
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        right: 20,
                        top: 3,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10 , bottom: 10),
                        child: Text('الكورسات المتاحة :',
                            style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                          future: cvm.getCours(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // Navigator.pushNamed(context, '/',
                                    //     arguments: snapshot.data?[index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: height*0.13,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              39, 187, 173, 255)),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(39, 187, 173, 255),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      right: 10),
                                                  child: Text(
                                                      '${snapshot.data?[index].courName}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall)),
                                              Text(
                                                '${snapshot.data?[index].description}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                textDirection:
                                                    TextDirection.rtl,
                                                textAlign: TextAlign.right,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            width: 100,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/p1.jpg',
                                                  ),
                                                  fit: BoxFit.fill),
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
