import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../infrastructure/navigation/routes.dart';
import '../components/components.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Obx(
                () => Column(
                  children: <Widget>[
                    MenuBar(
                      onSearchTyped: (keyword) => controller.search(keyword),
                    ),
                    if (controller.isLoading.value)
                      ...List.generate(
                        5,
                        (index) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 128,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    if (!controller.isLoading.value && controller.contentsShowing.value != null)
                      ...controller.contentsShowing.value!.map(
                        (e) => ListItem(
                          // imageUrl: "assets/images/paper_flower_overhead_bw_w1080.jpg",
                          title: e.title ?? '-',
                          description: e.body,
                          onPressed: () => Get.rootDelegate.toNamed(Routes.DETAIL, parameters: {'id': '${e.id}'}),
                        ),
                      ),
                    if (!controller.isLoading.value && controller.contentsShowing.value == null) const Text('Error'),
                    divider,
                    const Footer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
