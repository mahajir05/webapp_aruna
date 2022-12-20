import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/components.dart';
import 'controllers/detail.controller.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WebApp",
          style: GoogleFonts.montserrat(
            color: textPrimary,
            fontSize: 30,
            letterSpacing: 3,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
            onPressed: () => Get.rootDelegate.popRoute(), icon: const Icon(Icons.arrow_back), color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 32, right: 32, top: 32),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: marginBottom12,
                  child: Obx(
                    () => Text(
                      controller.selectedContent.value?.title ?? '-',
                      style: headlineTextStyle,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => TextBody(text: controller.selectedContent.value?.body ?? '-'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: PostNavigation(
                  onNextPressed: () => controller.goToNextContent(),
                  onPreviousPressed: () => controller.goToPrevContent(),
                ),
              ),
              divider,
              // Footer
              const Footer(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
