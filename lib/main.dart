import 'package:an_najah_project/helpers/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'core/theem/ligetheem.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final FlutterLocalization localization = FlutterLocalization.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    localization.init(
      mapLocales: [
         const MapLocale('ar',{}),

      ],
      initLanguageCode: 'ar',
    );
    return SafeArea(
      child: MaterialApp(
        supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.generateRoute,
        initialRoute: '/cours',
        title: 'Flutter Demo',
        theme: aapligetThem,

      ),
    );
  }
}
