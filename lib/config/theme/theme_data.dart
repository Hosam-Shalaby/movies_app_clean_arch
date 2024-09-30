import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyThemeData {
  // static Color lightPrimaryColor = const Color(0xFFB7935F);
  // static Color darkPrimaryColor = const Color(0xFF141A2E);
  // static bool isDarkSelected = true;
  static ThemeData lightTheme = ThemeData(
    // scaffoldBackgroundColor: ColorsConstant.scaffoldColor,
    fontFamily: 'Poppins',
    // dividerColor: lightPrimaryColor,
    // primaryColor: lightPrimaryColor,
    // cardColor: lightPrimaryColor,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      titleMedium: TextStyle(
          fontFamily: 'Poppins',
          // fontWeight: FontWeight.w600,
          fontSize: 13.sp,
          color: Colors.grey[700]),
      titleSmall: TextStyle(
          fontFamily: 'Poppins',
          // fontWeight: FontWeight.w600,
          fontSize: 9.sp,
          color: Colors.grey[900]),
      titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          color: Colors.black),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 17.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 20),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white),
    // appBarTheme: const AppBarTheme(
    //     iconTheme: IconThemeData(color: Colors.black),
    //     centerTitle: true,
    //     color: Colors.transparent,
    //     elevation: 0,
    //     titleTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold))
  );
  // static ThemeData darkTheme = ThemeData(
  //     // fontFamily: 'cairo',
  //     dividerColor: const Color.fromARGB(255, 224, 186, 32),
  //     primaryColor: darkPrimaryColor,
  //     cardColor: darkPrimaryColor,
  //     textTheme: const TextTheme(
  //         headlineMedium: TextStyle(
  //             fontFamily: 'ElMessiri',
  //             fontSize: 25,
  //             fontWeight: FontWeight.w600,
  //             color: Colors.white),
  //         titleMedium: TextStyle(
  //             fontFamily: 'Inter',
  //             fontWeight: FontWeight.bold,
  //             fontSize: 17,
  //             color: Colors.white),
  //         bodyMedium: TextStyle(
  //           fontFamily: 'DecoType',
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //           // color: Color.fromARGB(255, 224, 207, 52),
  //         )),
  //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //         selectedIconTheme: IconThemeData(size: 40),
  //         selectedItemColor: Color.fromARGB(255, 218, 202, 60),
  //         unselectedItemColor: Colors.white),
  //     scaffoldBackgroundColor: Colors.transparent,
  //     appBarTheme: const AppBarTheme(
  //         iconTheme: IconThemeData(color: Colors.white),
  //         centerTitle: true,
  //         color: Colors.transparent,
  //         elevation: 0,
  //         titleTextStyle: TextStyle(
  //             color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)));
}
