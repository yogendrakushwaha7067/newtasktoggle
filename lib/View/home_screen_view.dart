

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:new_task/Utilis/custom_snacbar.dart';
import 'dart:html' as html;
import 'dart:ui' as ui show platformViewRegistry;

import '../Controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {

  static const String routeName = "/home";
  final TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Toggles App",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: urlController,
                    decoration:  InputDecoration(
                      hintText: 'Enter Image URL',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(50),borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(50),borderSide: BorderSide(color: Colors.red)),
                      errorBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(50),borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button background color
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                   if(urlController.text.isNotEmpty) {
                     controller.imageUrl.value = urlController.text;
                   }
                   else{
                     showCustomSnackbar("Error", "Please Enter Image Url", false);
                   }
                  },
                  child: Text('Load Image'),
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (controller.imageUrl.isEmpty) return SizedBox();

                  final imgElement = html.ImageElement()
                    ..src = controller.imageUrl.value
                    ..style.width = controller.isFullscreen.value ? '100%' : '300px'
                    ..style.height = controller.isFullscreen.value ? '100%' : 'auto'
                    ..style.objectFit = 'contain'
                  ..style.borderRadius = '15px';


                  final viewType = 'image-${DateTime.now().millisecondsSinceEpoch}';
                  // ignore: undefined_prefixed_name
                  ui.PlatformViewRegistry.instance.registerViewFactory(viewType, (int viewId) => imgElement);

                  return GestureDetector(
                    onDoubleTap: () {
                      if (controller.isFullscreen.value) {
                        controller.exitFullscreen();
                      } else {
                        controller.enterFullscreen();
                      }
                    },
                    child: Container(
                      width: 300,
                      height: 300,
                      child: HtmlElementView(viewType: viewType),
                    ),
                  );
                }),
              ],
            ),
          ),
          Obx(() => controller.isMenuOpen.value
              ? GestureDetector(
            onTap: controller.toggleMenu,
            child: Container(
              color: Colors.black54,
              width: double.infinity,
              height: double.infinity,
            ),
          )
              : SizedBox()),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Obx(() => controller.isMenuOpen.value
                    ? Column(
                  children: [
                    FloatingActionButton.extended(
                      backgroundColor: Colors.red,
                      onPressed: controller.enterFullscreen,
                      label: Text('Enter Fullscreen',style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton.extended(
                      backgroundColor: Colors.red,
                      onPressed: controller.exitFullscreen,
                      label: Text('Exit Fullscreen',style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(height: 10),
                  ],
                )
                    : SizedBox()),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: controller.toggleMenu,
                  child: Icon(Icons.add,color: Colors.white,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
