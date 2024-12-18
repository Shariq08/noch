import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/modules/home/views/home_view.dart';
import 'package:noch/app/modules/reels/controllers/reels_controller.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';
import 'dart:math' as math;

class ReelsView extends GetView<ReelsController> {
  String? username;
  String? imgpath;
  String? desc;
  Function()? onPressedLike;
  Function()? onPressedComment;
  Function()? onPressedSave;
  bool islike;
  bool isLive;
  ReelsView(
      {super.key,
      required this.username,
      required this.imgpath,
      required this.desc,
      required this.onPressedLike,
      required this.islike,
      this.onPressedComment,
      this.onPressedSave,
      required this.isLive});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100.h,
          width: 100.w,
          child: Image.asset(
            imgpath!,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 80,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username!,
                  style: TextStyleUtil.openSans700(fontSize: 20),
                ),
                4.kheightBox,
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: isLive ? 200 : 250),
                  child: Text(
                    desc!,
                    style: TextStyleUtil.openSans400(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 70,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Like Button
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 32,
                      color: islike == true ? Colors.red : ColorUtil.whitetText,
                    ),
                    onPressed: onPressedLike,
                  ),
                  Text(
                    '2000',
                    style: TextStyleUtil.openSans400(fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Comment Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: onPressedComment,
                      child: reelIcon(
                        imgpath: ImageConstant.chatbubbles,
                        label: '100',
                      ),
                    ),
                    SizedBox(height: 16),

                    // Share Button
                    reelIcon(imgpath: ImageConstant.share, label: '70'),
                    SizedBox(height: 16),

                    // Save Button
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: ColorUtil.whitetrnsprnt,
                            context: context,
                            builder: (BuildContext context) {
                              return RestrBottomshet(
                                onFavTap: () {
                                  Get.back();
                                  showModalBottomSheet(
                                      backgroundColor: ColorUtil.whitetrnsprnt,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Column(
                                          children: [
                                            37.kheightBox,
                                            Text(
                                              'Save to favorites',
                                              style: TextStyleUtil.openSans600(
                                                  fontSize: 18,
                                                  color: ColorUtil.nblackText),
                                            ),
                                            53.kheightBox,
                                            Form(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Enter a note (optional)',
                                                    style: TextStyleUtil
                                                        .openSans600(
                                                            color: ColorUtil
                                                                .nblackText),
                                                  ),
                                                  8.kheightBox,
                                                  TextFormField(
                                                    maxLines: 3,
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter here',
                                                      fillColor:
                                                          ColorUtil.whitetText,
                                                      filled: true,
                                                      focusedBorder: const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorUtil
                                                                  .whitetrnsprnt),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                      border:
                                                          const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: ColorUtil
                                                                    .whitetrnsprnt,
                                                              ),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: ColorUtil
                                                                    .whitetrnsprnt,
                                                              ),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                  ),
                                                  8.kheightBox,
                                                  Row(children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8.0,
                                                                vertical: 16),
                                                        child: ElevatedButton(
                                                          onPressed: () {},
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                ColorUtil
                                                                    .nButtonColor,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        16,
                                                                    horizontal:
                                                                        50),
                                                            child: Text(
                                                              'Add to favorites',
                                                              style: TextStyleUtil
                                                                  .openSans600(
                                                                      fontSize:
                                                                          16,
                                                                      color: ColorUtil
                                                                          .nblackText),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ])
                                                ],
                                              ),
                                            ))
                                          ],
                                        );
                                      });
                                },
                                onListTap: () {
                                  Get.back();
                                  showModalBottomSheet(
                                      backgroundColor: ColorUtil.whitetrnsprnt,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Column(
                                          children: [
                                            37.kheightBox,
                                            Text(
                                              'Save to List',
                                              style: TextStyleUtil.openSans600(
                                                  fontSize: 18,
                                                  color: ColorUtil.nblackText),
                                            ),
                                            16.kheightBox,
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                                showModalBottomSheet(
                                                    context: context,
                                                    backgroundColor:
                                                        ColorUtil.whitetrnsprnt,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Column(
                                                        children: [
                                                          24.kheightBox,
                                                          Text(
                                                            'New List',
                                                            style: TextStyleUtil
                                                                .openSans600(
                                                                    fontSize:
                                                                        18,
                                                                    color: ColorUtil
                                                                        .nblackText),
                                                          ),
                                                          53.kheightBox,
                                                          Form(
                                                              child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        16.0,
                                                                    vertical:
                                                                        8),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'List Name',
                                                                  style: TextStyleUtil
                                                                      .openSans600(
                                                                          color:
                                                                              ColorUtil.nblackText),
                                                                ),
                                                                8.kheightBox,
                                                                TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        'Enter your list name here.',
                                                                    fillColor:
                                                                        ColorUtil
                                                                            .whitetText,
                                                                    filled:
                                                                        true,
                                                                    focusedBorder: const OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            color: ColorUtil
                                                                                .whitetrnsprnt),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(20))),
                                                                    border: const OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                          color:
                                                                              ColorUtil.whitetrnsprnt,
                                                                        ),
                                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    enabledBorder:
                                                                        const OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: ColorUtil.whitetrnsprnt,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(20))),
                                                                  ),
                                                                ),
                                                                24.kheightBox,
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          // maximumSize:
                                                                          // Size(163.kw,
                                                                          //     56.kh),
                                                                          side:
                                                                              BorderSide(color: ColorUtil.nButtonColor),
                                                                          elevation:
                                                                              0,
                                                                          backgroundColor:
                                                                              ColorUtil.nButtonColorLight2,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 32.0,
                                                                              vertical: 16),
                                                                          child:
                                                                              Text(
                                                                            'Cancel',
                                                                            style:
                                                                                TextStyleUtil.openSans600(fontSize: 16, color: ColorUtil.nblackText),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          elevation:
                                                                              0,
                                                                          backgroundColor:
                                                                              ColorUtil.nButtonColor,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 16,
                                                                              horizontal: 32),
                                                                          child:
                                                                              Text(
                                                                            'Save',
                                                                            style:
                                                                                TextStyleUtil.openSans600(fontSize: 16, color: ColorUtil.nblackText),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ])
                                                              ],
                                                            ),
                                                          ))
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Container(
                                                  height: 64.kh,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ColorUtil.whitetText,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  40))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Add New List',
                                                          style: TextStyleUtil
                                                              .openSans400(
                                                                  fontSize: 16,
                                                                  color: ColorUtil
                                                                      .nblackText),
                                                        ),
                                                        Image.asset(
                                                            ImageConstant
                                                                .addButton)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            16.kheightBox,
                                            saveListCard(),
                                            saveListCard(),
                                            saveListCard(),
                                          ],
                                        );
                                      });
                                },
                              );
                            });
                      },
                      child: reelIcon(
                        imgpath: ImageConstant.save,
                        label: '81',
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),

              isLive
                  ? Stack(
                      children: [
                        SizedBox(
                          height: 160.kh,
                          width: 160.kw,
                        ),
                        Positioned(
                          left: 30,
                          bottom: 0,
                          child: Container(
                            height: 160.kh,
                            width: 160.kw,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorUtil.nButtonColor,
                                width: 5,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                ImageConstant.live,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 60,
                            top: 40,
                            child: Container(
                              height: 26.kh,
                              width: 45.kw,
                              decoration: BoxDecoration(
                                  color: ColorUtil.nblack07,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Center(
                                child: Text(
                                  'Live!',
                                  style:
                                      TextStyleUtil.openSans600(fontSize: 12),
                                ),
                              ),
                            ))
                      ],
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 16),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           // Left Column
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   username!,
        //                   style: TextStyleUtil.openSans700(fontSize: 20),
        //                 ),
        //                 4.kheightBox,
        //                 ConstrainedBox(
        //                   constraints:
        //                       BoxConstraints(maxWidth: isLive ? 200 : 250),
        //                   child: Text(
        //                     desc!,
        //                     style: TextStyleUtil.openSans400(fontSize: 14),
        //                     overflow: TextOverflow.ellipsis,
        //                     maxLines: 3,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),

        //           // Right Column
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.end,
        //             children: [
        //               // Like Button
        //               Column(
        //                 children: [
        //                   IconButton(
        //                     icon: Icon(
        //                       Icons.favorite,
        //                       size: 32,
        //                       color: islike == true
        //                           ? Colors.red
        //                           : ColorUtil.whitetText,
        //                     ),
        //                     onPressed: onPressedLike,
        //                   ),
        //                   Text(
        //                     '2000',
        //                     style: TextStyleUtil.openSans400(fontSize: 12),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: 16),

        //               // Comment Button
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //                 child: Column(
        //                   children: [
        //                     InkWell(
        //                       onTap: onPressedComment,
        //                       child: reelIcon(
        //                         imgpath: ImageConstant.chatbubbles,
        //                         label: '100',
        //                       ),
        //                     ),
        //                     SizedBox(height: 16),

        //                     // Share Button
        //                     reelIcon(imgpath: ImageConstant.share, label: '70'),
        //                     SizedBox(height: 16),

        //                     // Save Button
        //                     InkWell(
        //                       onTap: () {
        //                         showModalBottomSheet(
        //                             backgroundColor: ColorUtil.whitetrnsprnt,
        //                             context: context,
        //                             builder: (BuildContext context) {
        //                               return RestrBottomshet(
        //                                 onFavTap: () {
        //                                   Get.back();
        //                                   showModalBottomSheet(
        //                                       backgroundColor:
        //                                           ColorUtil.whitetrnsprnt,
        //                                       context: context,
        //                                       builder: (BuildContext context) {
        //                                         return Column(
        //                                           children: [
        //                                             37.kheightBox,
        //                                             Text(
        //                                               'Save to favorites',
        //                                               style: TextStyleUtil
        //                                                   .openSans600(
        //                                                       fontSize: 18,
        //                                                       color: ColorUtil
        //                                                           .nblackText),
        //                                             ),
        //                                             53.kheightBox,
        //                                             Form(
        //                                                 child: Padding(
        //                                               padding: const EdgeInsets
        //                                                   .symmetric(
        //                                                   horizontal: 16.0,
        //                                                   vertical: 8),
        //                                               child: Column(
        //                                                 crossAxisAlignment:
        //                                                     CrossAxisAlignment
        //                                                         .start,
        //                                                 children: [
        //                                                   Text(
        //                                                     'Enter a note (optional)',
        //                                                     style: TextStyleUtil
        //                                                         .openSans600(
        //                                                             color: ColorUtil
        //                                                                 .nblackText),
        //                                                   ),
        //                                                   8.kheightBox,
        //                                                   TextFormField(
        //                                                     maxLines: 3,
        //                                                     decoration:
        //                                                         InputDecoration(
        //                                                       hintText:
        //                                                           'Enter here',
        //                                                       fillColor: ColorUtil
        //                                                           .whitetText,
        //                                                       filled: true,
        //                                                       focusedBorder: const OutlineInputBorder(
        //                                                           borderSide: BorderSide(
        //                                                               color: ColorUtil
        //                                                                   .whitetrnsprnt),
        //                                                           borderRadius:
        //                                                               BorderRadius.all(
        //                                                                   Radius.circular(
        //                                                                       20))),
        //                                                       border:
        //                                                           const OutlineInputBorder(
        //                                                               borderSide:
        //                                                                   BorderSide(
        //                                                                 color: ColorUtil
        //                                                                     .whitetrnsprnt,
        //                                                               ),
        //                                                               borderRadius:
        //                                                                   BorderRadius.all(
        //                                                                       Radius.circular(20))),
        //                                                       enabledBorder:
        //                                                           const OutlineInputBorder(
        //                                                               borderSide:
        //                                                                   BorderSide(
        //                                                                 color: ColorUtil
        //                                                                     .whitetrnsprnt,
        //                                                               ),
        //                                                               borderRadius:
        //                                                                   BorderRadius.all(
        //                                                                       Radius.circular(20))),
        //                                                     ),
        //                                                   ),
        //                                                   8.kheightBox,
        //                                                   Row(children: [
        //                                                     Expanded(
        //                                                       child: Padding(
        //                                                         padding: const EdgeInsets
        //                                                             .symmetric(
        //                                                             horizontal:
        //                                                                 8.0,
        //                                                             vertical:
        //                                                                 16),
        //                                                         child:
        //                                                             ElevatedButton(
        //                                                           onPressed:
        //                                                               () {},
        //                                                           style: ElevatedButton
        //                                                               .styleFrom(
        //                                                             elevation:
        //                                                                 0,
        //                                                             backgroundColor:
        //                                                                 ColorUtil
        //                                                                     .nButtonColor,
        //                                                           ),
        //                                                           child:
        //                                                               Padding(
        //                                                             padding: EdgeInsets.symmetric(
        //                                                                 vertical:
        //                                                                     16,
        //                                                                 horizontal:
        //                                                                     50),
        //                                                             child: Text(
        //                                                               'Add to favorites',
        //                                                               style: TextStyleUtil.openSans600(
        //                                                                   fontSize:
        //                                                                       16,
        //                                                                   color:
        //                                                                       ColorUtil.nblackText),
        //                                                             ),
        //                                                           ),
        //                                                         ),
        //                                                       ),
        //                                                     )
        //                                                   ])
        //                                                 ],
        //                                               ),
        //                                             ))
        //                                           ],
        //                                         );
        //                                       });
        //                                 },
        //                                 onListTap: () {
        //                                   Get.back();
        //                                   showModalBottomSheet(
        //                                       backgroundColor:
        //                                           ColorUtil.whitetrnsprnt,
        //                                       context: context,
        //                                       builder: (BuildContext context) {
        //                                         return Column(
        //                                           children: [
        //                                             37.kheightBox,
        //                                             Text(
        //                                               'Save to List',
        //                                               style: TextStyleUtil
        //                                                   .openSans600(
        //                                                       fontSize: 18,
        //                                                       color: ColorUtil
        //                                                           .nblackText),
        //                                             ),
        //                                             16.kheightBox,
        //                                             InkWell(
        //                                               onTap: () {
        //                                                 Get.back();
        //                                                 showModalBottomSheet(
        //                                                     context: context,
        //                                                     backgroundColor:
        //                                                         ColorUtil
        //                                                             .whitetrnsprnt,
        //                                                     builder:
        //                                                         (BuildContext
        //                                                             context) {
        //                                                       return Column(
        //                                                         children: [
        //                                                           24.kheightBox,
        //                                                           Text(
        //                                                             'New List',
        //                                                             style: TextStyleUtil.openSans600(
        //                                                                 fontSize:
        //                                                                     18,
        //                                                                 color: ColorUtil
        //                                                                     .nblackText),
        //                                                           ),
        //                                                           53.kheightBox,
        //                                                           Form(
        //                                                               child:
        //                                                                   Padding(
        //                                                             padding: const EdgeInsets
        //                                                                 .symmetric(
        //                                                                 horizontal:
        //                                                                     16.0,
        //                                                                 vertical:
        //                                                                     8),
        //                                                             child:
        //                                                                 Column(
        //                                                               crossAxisAlignment:
        //                                                                   CrossAxisAlignment
        //                                                                       .start,
        //                                                               children: [
        //                                                                 Text(
        //                                                                   'List Name',
        //                                                                   style:
        //                                                                       TextStyleUtil.openSans600(color: ColorUtil.nblackText),
        //                                                                 ),
        //                                                                 8.kheightBox,
        //                                                                 TextFormField(
        //                                                                   decoration:
        //                                                                       InputDecoration(
        //                                                                     hintText:
        //                                                                         'Enter your list name here.',
        //                                                                     fillColor:
        //                                                                         ColorUtil.whitetText,
        //                                                                     filled:
        //                                                                         true,
        //                                                                     focusedBorder:
        //                                                                         const OutlineInputBorder(borderSide: BorderSide(color: ColorUtil.whitetrnsprnt), borderRadius: BorderRadius.all(Radius.circular(20))),
        //                                                                     border: const OutlineInputBorder(
        //                                                                         borderSide: BorderSide(
        //                                                                           color: ColorUtil.whitetrnsprnt,
        //                                                                         ),
        //                                                                         borderRadius: BorderRadius.all(Radius.circular(20))),
        //                                                                     enabledBorder: const OutlineInputBorder(
        //                                                                         borderSide: BorderSide(
        //                                                                           color: ColorUtil.whitetrnsprnt,
        //                                                                         ),
        //                                                                         borderRadius: BorderRadius.all(Radius.circular(20))),
        //                                                                   ),
        //                                                                 ),
        //                                                                 24.kheightBox,
        //                                                                 Row(
        //                                                                     mainAxisAlignment:
        //                                                                         MainAxisAlignment.spaceBetween,
        //                                                                     children: [
        //                                                                       ElevatedButton(
        //                                                                         onPressed: () {
        //                                                                           Get.back();
        //                                                                         },
        //                                                                         style: ElevatedButton.styleFrom(
        //                                                                           // maximumSize:
        //                                                                           // Size(163.kw,
        //                                                                           //     56.kh),
        //                                                                           side: BorderSide(color: ColorUtil.nButtonColor),
        //                                                                           elevation: 0,
        //                                                                           backgroundColor: ColorUtil.nButtonColorLight2,
        //                                                                         ),
        //                                                                         child: Padding(
        //                                                                           padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        //                                                                           child: Text(
        //                                                                             'Cancel',
        //                                                                             style: TextStyleUtil.openSans600(fontSize: 16, color: ColorUtil.nblackText),
        //                                                                           ),
        //                                                                         ),
        //                                                                       ),
        //                                                                       ElevatedButton(
        //                                                                         onPressed: () {
        //                                                                           Get.back();
        //                                                                         },
        //                                                                         style: ElevatedButton.styleFrom(
        //                                                                           elevation: 0,
        //                                                                           backgroundColor: ColorUtil.nButtonColor,
        //                                                                         ),
        //                                                                         child: Padding(
        //                                                                           padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        //                                                                           child: Text(
        //                                                                             'Save',
        //                                                                             style: TextStyleUtil.openSans600(fontSize: 16, color: ColorUtil.nblackText),
        //                                                                           ),
        //                                                                         ),
        //                                                                       )
        //                                                                     ])
        //                                                               ],
        //                                                             ),
        //                                                           ))
        //                                                         ],
        //                                                       );
        //                                                     });
        //                                               },
        //                                               child: Padding(
        //                                                 padding:
        //                                                     const EdgeInsets
        //                                                         .symmetric(
        //                                                         horizontal:
        //                                                             16.0),
        //                                                 child: Container(
        //                                                   height: 64.kh,
        //                                                   width: 100.w,
        //                                                   decoration: BoxDecoration(
        //                                                       color: ColorUtil
        //                                                           .whitetText,
        //                                                       borderRadius: BorderRadius
        //                                                           .all(Radius
        //                                                               .circular(
        //                                                                   40))),
        //                                                   child: Padding(
        //                                                     padding:
        //                                                         const EdgeInsets
        //                                                             .symmetric(
        //                                                             horizontal:
        //                                                                 16.0,
        //                                                             vertical:
        //                                                                 20),
        //                                                     child: Row(
        //                                                       mainAxisAlignment:
        //                                                           MainAxisAlignment
        //                                                               .spaceBetween,
        //                                                       children: [
        //                                                         Text(
        //                                                           'Add New List',
        //                                                           style: TextStyleUtil.openSans400(
        //                                                               fontSize:
        //                                                                   16,
        //                                                               color: ColorUtil
        //                                                                   .nblackText),
        //                                                         ),
        //                                                         Image.asset(
        //                                                             ImageConstant
        //                                                                 .addButton)
        //                                                       ],
        //                                                     ),
        //                                                   ),
        //                                                 ),
        //                                               ),
        //                                             ),
        //                                             16.kheightBox,
        //                                             saveListCard(),
        //                                             saveListCard(),
        //                                             saveListCard(),
        //                                           ],
        //                                         );
        //                                       });
        //                                 },
        //                               );
        //                             });
        //                       },
        //                       child: reelIcon(
        //                         imgpath: ImageConstant.save,
        //                         label: '81',
        //                       ),
        //                     ),
        //                     SizedBox(height: 16),
        //                   ],
        //                 ),
        //               ),

        //               isLive
        //                   ? Stack(
        //                       children: [
        //                         SizedBox(
        //                           height: 160.kh,
        //                           width: 160.kw,
        //                         ),
        //                         Positioned(
        //                           left: 30,
        //                           bottom: 0,
        //                           child: Container(
        //                             height: 160.kh,
        //                             width: 160.kw,
        //                             decoration: BoxDecoration(
        //                               shape: BoxShape.circle,
        //                               border: Border.all(
        //                                 color: ColorUtil.nButtonColor,
        //                                 width: 5,
        //                               ),
        //                             ),
        //                             child: ClipOval(
        //                               child: Image.asset(
        //                                 ImageConstant.live,
        //                                 fit: BoxFit.fill,
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                         Positioned(
        //                             left: 60,
        //                             top: 40,
        //                             child: Container(
        //                               height: 26.kh,
        //                               width: 45.kw,
        //                               decoration: BoxDecoration(
        //                                   color: ColorUtil.nblack07,
        //                                   borderRadius: BorderRadius.all(
        //                                       Radius.circular(100))),
        //                               child: Center(
        //                                 child: Text(
        //                                   'Live!',
        //                                   style: TextStyleUtil.openSans600(
        //                                       fontSize: 12),
        //                                 ),
        //                               ),
        //                             ))
        //                       ],
        //                     )
        //                   : SizedBox.shrink()
        //             ],
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

Padding saveListCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Container(
      height: 64.kh,
      width: 100.w,
      decoration: BoxDecoration(
          color: ColorUtil.whitetText,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  ImageConstant.listImg,
                ),
                8.kwidthBox,
                Text(
                  'Top 10 Rooftop Restaurants',
                  style: TextStyleUtil.openSans400(
                      fontSize: 16, color: ColorUtil.nblackText),
                ),
              ],
            ),
            Image.asset(ImageConstant.addButton)
          ],
        ),
      ),
    ),
  );
}

Row reelIcon({String? imgpath, String? label}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        children: [
          Image.asset(
            imgpath!,
            height: 32.kh,
            width: 32.kh,
          ),
          Text(
            label!,
            style: TextStyleUtil.openSans400(fontSize: 12),
          )
        ],
      )
    ],
  );
}

class CircleArcWidget extends StatelessWidget {
  const CircleArcWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(160.kw, 160.kh),
      painter: CircleArcPainter(),
    );
  }
}

class CircleArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint properties
    final paint = Paint()
      ..color = Colors.green // Arc color
      ..style = PaintingStyle.stroke // Use stroke to draw an arc
      ..strokeWidth = 4.0; // Arc thickness

    // Define the arc's rectangle bounds
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Draw a 3/4 circle arc (270 degrees)
    canvas.drawArc(
      rect,
      math.pi / 4, // Start at the top (12 o'clock)
      3 * math.pi / 2, // Sweep angle for 270 degrees
      false, // Use false for an open arc
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
