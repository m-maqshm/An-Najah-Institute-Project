import 'package:flutter/material.dart';

ThemeData aapligetThem = ThemeData(
    useMaterial3: false,


    appBarTheme: AppBarTheme(backgroundColor: Colors.blue),

    textTheme: const TextTheme(

        bodyMedium: TextStyle(fontFamily: "shahdFont",fontSize: 17, fontWeight:FontWeight.bold,color: Colors.black),
    bodySmall: TextStyle(fontFamily: "cairo.ttf",fontSize: 12,fontWeight: FontWeight.normal, color: Colors.black),
        bodyLarge: TextStyle(fontFamily: "cairo.ttf",fontSize: 14,fontWeight: FontWeight.normal, color: Colors.black),
        titleLarge: TextStyle(fontFamily: "shorog",fontSize: 36,fontWeight: FontWeight.normal, color: Colors.black),
        titleSmall: TextStyle(fontFamily: "cairo.ttf",fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),
    ),


    elevatedButtonTheme: ElevatedButtonThemeData(

        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 130, 124, 186)),
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(5))
        ),
        
    ),

// textSelectionTheme: TextSelectionThemeData()

);
// backgroundColor: const Color.fromARGB(255, 130, 124, 186),
// foregroundColor: Colors.white