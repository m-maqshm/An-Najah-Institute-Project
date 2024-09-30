import 'package:an_najah_project/helpers/route_manager.dart';
import 'package:flutter/material.dart';

import 'core/theem/ligetheem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.generateRoute,
        initialRoute: '/testVM',
        title: 'Flutter Demo',
        theme: aapligetThem,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: false,
        // ),
      ),
    );
  }
}
