import 'package:get/get.dart';

import '../Controller/home_controller.dart';
import '../View/home_screen_view.dart';






class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: HomeScreen.routeName,
      page: () =>   HomeScreen(),
      bindings: [
        BindingsBuilder.put(() => HomeController()),

      ],
    ),





  ];
}