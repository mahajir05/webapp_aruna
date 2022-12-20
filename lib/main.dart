import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'infrastructure/navigation/bindings/domains/data_bindings.dart';
import 'infrastructure/navigation/navigation.dart';

void main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Flutter WebApp',
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      ),
      initialBinding: DataBinding(),
      getPages: Nav.routes,
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouteDelegate(),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}

class AppRouteDelegate extends GetDelegate {
  @override
  Future<void> setNewRoutePath(GetNavConfig configuration) async {
    debugPrint('[AppRouteDelegate][setNewRoutePath] route path: ${configuration.location}');
    DataBinding().dependencies();
    HomeControllerBinding().dependencies();
    return super.setNewRoutePath(configuration);
  }
}

class AppRouteInformationParser extends GetInformationParser {
  @override
  SynchronousFuture<GetNavConfig> parseRouteInformation(RouteInformation routeInformation) {
    var location = routeInformation.location;
    debugPrint('[AppRouteInformationParser][parseRouteInformation] route path: $location');

    final matchResult = Get.routeTree.matchRoute(location ?? initialRoute);

    return SynchronousFuture(
      GetNavConfig(
        currentTreeBranch: matchResult.treeBranch,
        location: location,
        state: routeInformation.state,
      ),
    );
  }
}
