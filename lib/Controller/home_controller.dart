

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:html' as html;
class HomeController extends GetxController {
  var imageUrl = ''.obs;
  var isMenuOpen = false.obs;
  var isFullscreen = false.obs;

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }

  void enterFullscreen() {
    html.document.documentElement?.requestFullscreen();
    isFullscreen.value = true;
    isMenuOpen.value = false;
  }

  void exitFullscreen() {
    html.document.exitFullscreen();
    isFullscreen.value = false;
    isMenuOpen.value = false;
  }
}
