import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/home/views/home_view.dart';
import 'package:noch/app/modules/reels/views/home2_view.dart';
import 'package:noch/app/modules/restaurant/views/restaurant_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  NavigationView({super.key});
  final List<Widget> pages = [
    HomeView(),
    Home2View(),
    RestaurantView(),
    HomeView(),
    HomeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
        children: pages,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: ColorUtil.transparentTab,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: [
            BottomNavigationBarItem(
              activeIcon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.homeon,
              ),
              icon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.homeoff,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.multipleuserson,
              ),
              icon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.multipleusersoff,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                height: 3.5.h,
                width: 28.kw,
                child: Image.asset(
                  ImageConstant.spoonknifeoff,
                  height: 8,
                  fit: BoxFit.fill,
                  color: ColorUtil.nButtonColor,
                ),
              ),
              icon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.spoonknifeon,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.calendaron,
              ),
              icon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.calendaroff,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.useron,
              ),
              icon: TabIcon(
                h: 28.kh,
                w: 28.kw,
                path: ImageConstant.usersoff,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class TabIcon extends StatelessWidget {
  double? h;
  double? w;
  String? path;
  TabIcon({super.key, this.h, this.w, this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: Image.asset(
        path!,
        height: h,
        width: w,
        fit: BoxFit.fill,
      ),
    );
  }
}
