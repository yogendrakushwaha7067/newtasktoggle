import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/home_controller.dart';
import 'Utilis/app_routes.dart';
import 'View/home_screen_view.dart';


void main() {
  runApp(GetMaterialApp(
    title: "Toggles App",
    debugShowCheckedModeBanner: false,
    getPages: AppRoutes.routes,
    initialRoute: HomeScreen.routeName,
  ));
}


