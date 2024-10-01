import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:movies_application/config/di/di.dart';
import 'package:movies_application/presentation/views/bottom_nav_bar.dart';
import 'package:movies_application/presentation/views/movie_details_screen.dart';
import 'package:movies_application/presentation/views/splash_screen.dart';
import 'config/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            theme: MyThemeData.lightTheme,
            routes: {
              MovieDetailsScreen.routeName: (context) =>
                  const MovieDetailsScreen(),
              BottomNavBar.routeName: (context) => const BottomNavBar(),
              SplashScreen.routeName: (context) => const SplashScreen(),
            },
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
          );
        });
  }
}


// flutter packages pub run build_runner watch