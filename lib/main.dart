import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/routing/route_configs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (
          BuildContext context,
          Widget? child,
          ) =>
          _buildMaterialApp(context),
    );
  }

  MaterialApp _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteConfig.router,
      title: strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: CustomColors.primarySwatch,
          backgroundColor: Colors.white,
        ),
        primarySwatch: CustomColors.primarySwatch,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: customColors.hintColor,
          selectionColor: customColors.lightRed,
          selectionHandleColor: customColors.lightRed,
        ),
        dividerTheme: DividerThemeData(
          color: customColors.lightBlack.withOpacity(0.2),
        ),
        textTheme: Theme.of(context).textTheme.apply(
          fontSizeFactor: 0.8,
          fontSizeDelta: 2.0,
          fontFamily: 'SFProDisplay',
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        fontFamily: 'SFProDisplay',
        scaffoldBackgroundColor: Colors.white.withOpacity(0.98),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
