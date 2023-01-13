import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_test/views/desktop/desktop_view.dart';
import 'package:web_test/views/desktop/small_desktop_view.dart';
import 'package:web_test/views/mobile/mobile_view.dart';
import 'package:web_test/views/tab/large_tab_view.dart';
import 'package:web_test/views/tab/normal_tab_view.dart';
import 'package:web_test/views/tab/small_tab_view.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({
    super.key,
  });

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => RefinedLayoutBuilder(
        normal: (context) => MobileView(),
        small: (context) => MobileView(),
        large: (context) => MobileView(),
      ),
      tablet: (context) => RefinedLayoutBuilder(
        normal: (context) => const NormalTabView(),
        small: (context) => const SmallTabView(),
        large: (context) => const LargeTabView(),
      ),
      desktop: (context) => RefinedLayoutBuilder(
        normal: (context) => const DesktopView(),
        small: (context) => SmallDesktopView(),
        large: (context) => const DesktopView(),
      ),
    );
  }
}










