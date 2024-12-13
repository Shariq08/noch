import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:noch/app/components/noch_appbar.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';

import '../controllers/restaurant_photos_controller.dart';

class RestaurantPhotosView extends GetView<RestaurantPhotosController> {
  const RestaurantPhotosView({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageConstant.restrback,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  ColorUtil.gradient_1,
                  ColorUtil.gradient_2,
                  ColorUtil.gradient_2,
                  ColorUtil.gradient_1,
                ])),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: NochAppbar(title: 'Photos'),
          body: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: ColorUtil.whitetrnsprnt,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                  ),
                  child: StaggeredGridView.countBuilder(
                      itemCount: controller.imageAssets.length,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                controller.imageAssets[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      staggeredTileBuilder: (index) {
                        // Alternate large tiles between columns
                        if (index % 4 == 0) {
                          return StaggeredTile.count(1, 2); // Larger tile
                        }
                        return StaggeredTile.count(1, 1); // Regular tile
                      }
                      // index % 7 == 0
                      //     ? StaggeredTile.count(1, 2)
                      //     : StaggeredTile.count(1, 1
                      ))),
        )
      ],
    );
  }
}
