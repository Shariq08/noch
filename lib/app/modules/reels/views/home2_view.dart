import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/home/views/comments_view.dart';
import 'package:noch/app/modules/home/views/notification_view.dart';
import 'package:noch/app/modules/reels/controllers/reels_controller.dart';
import 'package:noch/app/modules/reels/views/whitecode_view.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';

bool isVideoUrl(String url) {
  final videoExtensions = ['.mp4', '.avi', '.mov', '.mkv', '.webm'];
  return videoExtensions
      .any((extension) => url.toLowerCase().endsWith(extension));
}

class Home2View extends GetView<ReelsController> {
  Home2View({super.key});
  List<String> reels = [
    "https://assets.mixkit.co/videos/39767/39767-thumb-360-0.jpg",
    "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_10mb.mp4",
    "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_20mb.mp4",
    "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_30mb.mp4",
    "https://sample-videos.com/video321/mp4/480/big_buck_bunny_480p_1mb.mp4",
    "https://sample-videos.com/video321/mp4/480/big_buck_bunny_480p_2mb.mp4",
    "https://sample-videos.com/video321/mp4/480/big_buck_bunny_480p_5mb.mp4",
    "https://sample-videos.com/video321/mp4/480/big_buck_bunny_480p_10mb.mp4",
    "https://sample-videos.com/video321/mp4/480/big_buck_bunny_480p_20mb.mp4",
    "https://sample-videos.com/video321/mp4/480/big_buck_bunny_480p_30mb.mp4",
    "https://sample-videos.com/video321/mp4/360/big_buck_bunny_360p_1mb.mp4",
    "https://sample-videos.com/video321/mp4/360/big_buck_bunny_360p_2mb.mp4",
    "https://sample-videos.com/video321/mp4/360/big_buck_bunny_360p_5mb.mp4",
    "https://sample-videos.com/video321/mp4/360/big_buck_bunny_360p_10mb.mp4",
    "https://sample-videos.com/video321/mp4/360/big_buck_bunny_360p_20mb.mp4",
    "https://sample-videos.com/video321/mp4/360/big_buck_bunny_360p_30mb.mp4",
    "https://sample-videos.com/video321/mp4/240/big_buck_bunny_240p_1mb.mp4",
    "https://sample-videos.com/video321/mp4/240/big_buck_bunny_240p_2mb.mp4",
    "https://sample-videos.com/video321/mp4/240/big_buck_bunny_240p_5mb.mp4",
    "https://sample-videos.com/video321/mp4/240/big_buck_bunny_240p_10mb.mp4",
    "https://sample-videos.com/video321/mp4/240/big_buck_bunny_240p_20mb.mp4",
    "https://sample-videos.com/video321/mp4/240/big_buck_bunny_240p_30mb.mp4"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: WhiteCodelReels(
                key: UniqueKey(),
                context: context,
                loader: const Center(
                  child: CircularProgressIndicator(),
                ),
                isCaching: false,
                videoList: reels,
                // List.generate(reels.length, (index) => reels[index]),
                builder: (context, index, child, videoPlayerController,
                    pageController) {
                  bool isImage = !isVideoUrl(reels[index]);
                  bool isReadMore = false;
                  StreamController<double> videoProgressController =
                      StreamController<double>();
                  if (!isImage) {
                    videoPlayerController.addListener(() {
                      double videoProgress = videoPlayerController
                              .value.position.inMilliseconds /
                          videoPlayerController.value.duration.inMilliseconds;
                      videoProgressController.add(videoProgress);
                    });
                  }

                  return Stack(
                    children: [
                      if (isImage)
                        Center(
                          child: Image.network(
                            reels[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                  child: Icon(Icons.error, size: 50));
                            },
                          ),
                        )
                      else
                        child, // Video Player Widget

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20.kh,
                                    width: 20.kw,
                                    child: Image.asset(
                                      ImageConstant.add,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 124.kw,
                                    height: 32.kh,
                                    child: Image.asset(
                                      ImageConstant.nochLogo,
                                      width: 124.kw,
                                      height: 32.kh,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageConstant.compass,
                                        width: 24.kw,
                                        height: 24.kh,
                                        fit: BoxFit.fill,
                                      ),
                                      8.kwidthBox,
                                      InkWell(
                                        onTap: controller
                                            .toggleNotificationVisibility,
                                        child: Image.asset(
                                          ImageConstant.notification,
                                          width: 24.kw,
                                          height: 24.kh,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            16.kheightBox,
                            Obx(
                              () => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'For you',
                                    style: TextStyleUtil.openSans600(),
                                  ),
                                  6.kwidthBox,
                                  // FittedBox(
                                  //   child: Transform.scale(
                                  //     alignment: Alignment.centerLeft,
                                  //     scale: 0.6,
                                  //     child: FittedBox(
                                  //         fit: BoxFit.fill,
                                  //         // controller.isSwitchedOn.value
                                  //         child: Switch(
                                  //           trackOutlineColor:
                                  //               WidgetStateProperty.resolveWith<Color?>(
                                  //                   (Set<WidgetState> states) {
                                  //             if (states.contains(WidgetState.selected)) {
                                  //               return ColorUtil.nButtonColor;
                                  //             }

                                  //             return ColorUtil.whitetText;
                                  //           }),
                                  //           inactiveTrackColor: Colors.transparent,
                                  //           // inactiveThumbColor: ColorUtil.whitetText,
                                  //           thumbColor:
                                  //               WidgetStateProperty.resolveWith<Color?>(
                                  //                   (Set<WidgetState> states) {
                                  //             if (states.contains(WidgetState.selected)) {
                                  //               return Colors.transparent;
                                  //             }

                                  //             return ColorUtil.whitetText;
                                  //           }),
                                  //           activeColor: controller.isSwitchedOn.value
                                  //               ? ColorUtil.nButtonColor
                                  //               : Colors.transparent,
                                  //           value: controller.isSwitchedOn.value,
                                  //           onChanged: (bool value) {
                                  //             // This is called when the user toggles the switch.

                                  //             controller.isSwitchedOn.value =
                                  //                 !controller.isSwitchedOn.value;
                                  //           },
                                  //         )),
                                  //   ),
                                  // )
                                  Transform.scale(
                                    alignment: Alignment.centerLeft,
                                    scale: 0.6,
                                    child: Theme(
                                      data: ThemeData(
                                        useMaterial3: true,
                                      ).copyWith(
                                        colorScheme: Theme.of(context)
                                            .colorScheme
                                            .copyWith(
                                                outline: ColorUtil.whitetText),
                                      ),
                                      child: Switch(
                                        activeColor: Colors.transparent,
                                        value: controller.isSwitchedOn.value,
                                        activeTrackColor:
                                            ColorUtil.nButtonColor,
                                        inactiveTrackColor: Colors.transparent,
                                        thumbColor: WidgetStateProperty
                                            .resolveWith<Color?>(
                                          (Set<WidgetState> states) {
                                            if (states.contains(
                                                    WidgetState.pressed) ||
                                                states.contains(
                                                    WidgetState.selected)) {
                                              return Colors.grey;
                                            }
                                            return ColorUtil.whitetText;
                                          },
                                        ),
                                        onChanged: controller.toggleSwitch,
                                      ),
                                    ),
                                  ),
                                  // Transform.scale(
                                  //   alignment: Alignment.centerLeft,
                                  //   scale: 0.9,
                                  //   child: SlidingToggleSwitch(
                                  //     width: 26.kw,
                                  //     height: 14.kh,
                                  //     disabled: false,
                                  //     initialValue: controller.isSwitchedOn.value,
                                  //     thumbDisabledColor: ColorUtil.whitetText,
                                  //     thumbOnColor: ColorUtil.blackgrey,
                                  //     trackDisabledColor: Colors.grey.shade600,
                                  //     trackOffColor: Colors.transparent,
                                  //     trackOnColor: ColorUtil.nButtonColor,
                                  //     thumbOffColor: ColorUtil.whitetText,
                                  //     borderColor: ColorUtil.whitetText,
                                  //     borderWidth: 1,
                                  //     onChange: controller.toggleSwitch,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (controller.isCommentVisible.value)
                        GestureDetector(
                          onTap: controller.toggleCommentVisibility,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: CommentsView(),
                            ),
                          ),
                        ),
                      if (controller.isNotificationVisible.value)
                        GestureDetector(
                          onTap: controller.toggleNotificationVisibility,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: NotificationView(),
                            ),
                          ),
                        ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StatefulBuilder(
                              builder: (context, setState) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isReadMore = !isReadMore;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.0),
                                          Colors.black.withOpacity(0.2),
                                          Colors.black.withOpacity(0.5),
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 50, left: 10),
                                          child: Text(
                                            '@nicolefisher',
                                            style: TextStyleUtil.openSans700(
                                                fontSize: 20),
                                          ),
                                        ),
                                        4.kheightBox,
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: 300,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 50, left: 10),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Loving these tasty pizzas from @domino’s. ',
                                                  maxLines:
                                                      isReadMore ? 100 : 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyleUtil.openSans400(
                                                          fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 70,
                        right: 10,
                        child: SizedBox(
                          height: 450,
                          // color: Colors.red.withOpacity(0.5),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      true
                                          ? Icons.thumb_up_alt
                                          : Icons.thumb_up_alt_outlined,
                                      color: Color.fromARGB(
                                        255,
                                        214,
                                        183,
                                        8,
                                      ),
                                    ),
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      '10K',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      false
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      '10K',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.comment,
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                    child: Text(
                                      '10K',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Share',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      false
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Save',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (!isImage)
                        StreamBuilder(
                          stream: videoProgressController.stream,
                          builder: (context, snapshot) {
                            return Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbShape: SliderComponentShape.noThumb,
                                  overlayShape: SliderComponentShape.noOverlay,
                                  trackHeight: 2,
                                ),
                                child: Slider(
                                  value: (snapshot.data ?? 0).clamp(0.0, 1.0),
                                  min: 0.0,
                                  max: 1.0,
                                  activeColor: Colors.red,
                                  inactiveColor: Colors.white,

                                  onChanged: (value) {
                                    final position = videoPlayerController
                                            .value.duration.inMilliseconds *
                                        value;
                                    videoPlayerController.seekTo(Duration(
                                        milliseconds: position.toInt()));
                                  },
                                  // onChangeEnd: (value) {
                                  //   videoPlayerController.play();
                                  // },
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
