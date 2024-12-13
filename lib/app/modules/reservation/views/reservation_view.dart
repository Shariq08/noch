import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:noch/app/constants/image_constant.dart';
import 'package:noch/app/services/colors.dart';
import 'package:noch/app/services/custom_button.dart';
import 'package:noch/app/services/responsive_size.dart';
import 'package:noch/app/services/text_style_util.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../controllers/reservation_controller.dart';

class ReservationView extends GetView<ReservationController> {
  const ReservationView({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey expansionkey = GlobalKey();
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          ImageConstant.restrback,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Reservation',
              style: TextStyleUtil.openSans600(fontSize: 18),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorUtil.whitetText,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: ColorUtil.whitetrnsprnt,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      32.kheightBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.kh,
                            width: 80.kw,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtil.restrReviewProfile),
                            child: Center(
                              child: Text(
                                'H A T C H',
                                style: TextStyleUtil.openSans700(
                                    fontSize: 12.6,
                                    color: ColorUtil.nblackText2),
                              ),
                            ),
                          ),
                          8.kwidthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 200),
                                child: Text(
                                  'The Hatch Rotisserie & Bar',
                                  style: TextStyleUtil.openSans700(
                                      fontSize: 20,
                                      color: ColorUtil.nblackText),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                              Text(
                                '835 13th St. Paso Robles, CA 93446',
                                style: TextStyleUtil.openSans600(
                                    color: ColorUtil.nblackText),
                              ),
                              8.kheightBox,
                              Row(
                                children: [
                                  nReservationChip(title: 'American'),
                                  8.kwidthBox,
                                  nReservationChip(title: r'$$$$'),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booking type',
                            style: TextStyleUtil.openSans600(
                                fontSize: 18, color: ColorUtil.nblackText),
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      8.kheightBox,
                      Obx(() => ExpansionTile(
                            key: expansionkey,
                            initiallyExpanded: controller.isExpanded.value,
                            onExpansionChanged: (value) {
                              controller.isExpanded.value = value;
                            },
                            childrenPadding:
                                EdgeInsets.only(left: 16, bottom: 16),
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            backgroundColor: ColorUtil.whitetText,
                            collapsedBackgroundColor: ColorUtil.whitetText,
                            collapsedShape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            title: Text(
                              controller.bookingTitle.value,
                              style: TextStyleUtil.openSans600(
                                  fontSize: 16, color: ColorUtil.nblackText),
                            ),
                            showTrailingIcon: false,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.updateBookingTitle('Gathering');
                                  controller.toggleExpansion();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gathering',
                                      style: TextStyleUtil.openSans600(
                                          fontSize: 16,
                                          color: ColorUtil.nblackText),
                                    ),
                                  ],
                                ),
                              ),
                              // 8.kheightBox,
                              // InkWell(
                              //   onTap: () {
                              //     controller.updateBookingTitle('Gathering');
                              //   },
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         'Gathering',
                              //         style: TextStyleUtil.openSans600(
                              //             fontSize: 16, color: ColorUtil.nblackText),
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          )),
                      24.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Party size',
                            style: TextStyleUtil.openSans600(
                                fontSize: 18, color: ColorUtil.nblackText),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: controller.decrementPartySize,
                                child: Container(
                                    height: 25.6.kh,
                                    width: 25.6.kw,
                                    decoration: BoxDecoration(
                                        color: ColorUtil.nButtonColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.2))),
                                    child: Icon(Icons.remove)),
                              ),
                              8.kwidthBox,
                              Obx(
                                () => Container(
                                    height: 26.kh,
                                    width: 41.kw,
                                    decoration: BoxDecoration(
                                        color: ColorUtil.whitetText,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.7))),
                                    child: Center(
                                      child: Text(
                                        '${controller.partySize.value}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorUtil.nblackText,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              ),
                              8.kwidthBox,
                              GestureDetector(
                                onTap: controller.incrementPartySize,
                                child: Container(
                                    height: 25.6.kh,
                                    width: 25.6.kw,
                                    decoration: BoxDecoration(
                                        color: ColorUtil.nButtonColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.2))),
                                    child: Icon(Icons.add)),
                              ),
                            ],
                          )
                        ],
                      ),
                      24.kheightBox,
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Choose date',
                              style: TextStyleUtil.openSans600(
                                  fontSize: 18, color: ColorUtil.nblackText),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.toggleCalendarVisibality();
                              },
                              child: controller.isDateSelected.value
                                  ? Text(DateFormat('dd/MM/yyyy')
                                      .format(controller.today.value))
                                  : Icon(controller.iscalendarVisible.value
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_right),
                            )
                          ],
                        ),
                      ),
                      16.kheightBox,
                      Obx(() => Visibility(
                            visible: controller.iscalendarVisible.value,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Select Date',
                                      style: TextStyleUtil.openSans600(
                                          fontSize: 16,
                                          color: ColorUtil.nblackText),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.brightness_1_outlined,
                                          size: 16,
                                        ),
                                        8.kwidthBox,
                                        Text(
                                          'dates unavailable',
                                          style: TextStyleUtil.openSans600(
                                              fontSize: 16,
                                              color: ColorUtil.nblackText),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                8.kheightBox,
                                Container(
                                    decoration: BoxDecoration(
                                        color: ColorUtil.whitetText,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: TableCalendar(
                                      calendarStyle: CalendarStyle(
                                          todayTextStyle: TextStyle(
                                              color: ColorUtil.nblackText,
                                              fontWeight: FontWeight.bold),
                                          todayDecoration: BoxDecoration(
                                              color: ColorUtil.nButtonColor,
                                              shape: BoxShape.circle),
                                          selectedDecoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorUtil.nButtonColor),
                                          selectedTextStyle: TextStyle(
                                              color: ColorUtil.nblackText,
                                              fontWeight: FontWeight.bold),
                                          defaultTextStyle: TextStyle(
                                              color: ColorUtil.nblackText,
                                              fontWeight: FontWeight.bold)),
                                      headerStyle: HeaderStyle(
                                          headerMargin:
                                              EdgeInsets.only(bottom: 16),
                                          titleTextStyle:
                                              TextStyleUtil.openSans600(
                                                  fontSize: 18,
                                                  color: ColorUtil.nblackText),
                                          headerPadding: EdgeInsets.all(0),
                                          decoration: BoxDecoration(
                                              color: ColorUtil.nButtonColor),
                                          formatButtonVisible: false,
                                          titleCentered: true),
                                      availableGestures: AvailableGestures.all,
                                      focusedDay: controller.today.value,
                                      firstDay: DateTime(2000),
                                      lastDay: DateTime(3000),
                                      selectedDayPredicate: (day) => isSameDay(
                                          day, controller.today.value),
                                      onDaySelected: (selectedDay, focusedDay) {
                                        controller.onDaySelected(
                                            selectedDay, focusedDay);
                                        controller.toggleCalendarVisibality();
                                      },
                                    )),
                              ],
                            ),
                          )),
                      24.kheightBox,
                      Text(
                        'Book a slot',
                        style: TextStyleUtil.openSans600(
                            fontSize: 18, color: ColorUtil.nblackText),
                      ),
                      16.kheightBox,
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 3,
                        ),
                        itemBuilder: (context, index) {
                          String time = controller.getTimeForSlot(index);
                          return Obx(() {
                            return slotChip(
                              time: time,
                              isselected:
                                  controller.selectedSlots.contains(index),
                              onTap: () => controller.toggleSelection(index),
                            );
                          });
                        },
                      ),
                      16.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            ImageConstant.gallery2,
                          ),
                          Text(
                            'Layout',
                            style: TextStyleUtil.openSans400(
                                fontSize: 14, color: ColorUtil.nblackText),
                          )
                        ],
                      ),
                      8.kheightBox,
                      ExpansionTile(
                        dense: true,
                        title: Text(
                          'Table preference (optional)',
                          style: TextStyleUtil.openSans600(
                              fontSize: 16, color: ColorUtil.nblackText),
                        ),
                        backgroundColor: ColorUtil.whitetText,
                        collapsedBackgroundColor: ColorUtil.whitetText,
                        collapsedShape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        children: [
                          Obx(() => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  spacing: 12,
                                  runSpacing: 8,
                                  children: [
                                    ...controller.tablepref
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      int index = entry.key;
                                      String i = entry.value;

                                      return GestureDetector(
                                        onTap: () {
                                          controller.toggleTablePref(index);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: controller.selectedTablePref
                                                    .contains(index)
                                                ? ColorUtil.nButtonColor
                                                : ColorUtil.whitetText,
                                            border: Border.all(
                                              color: ColorUtil.ncircleavatar,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Text(
                                            i,
                                            style: TextStyle(
                                              color: ColorUtil.nblackText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ))

                          // LayoutBuilder(
                          //   builder: (BuildContext context,
                          //       BoxConstraints constraints) {
                          //     int crossAxisCount = (constraints.maxWidth / 150)
                          //         .floor()
                          //         .clamp(2, 3);
                          //     return GridView.builder(
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemCount: 10,
                          //       gridDelegate:
                          //           SliverGridDelegateWithMaxCrossAxisExtent(
                          //         maxCrossAxisExtent: 200,
                          //         crossAxisSpacing: 16,
                          //         mainAxisSpacing: 16,
                          //         childAspectRatio: 3.5,
                          //       ),
                          //       itemBuilder: (context, index) {
                          //         String pref = controller.getTablePref(index);
                          //         return Obx(() {
                          //           return slotChip(
                          //             isIcon: false,
                          //             time: pref,
                          //             isselected: controller.selectedTablePref
                          //                 .contains(index),
                          //             onTap: () =>
                          //                 controller.toggleTablePref(index),
                          //           );
                          //         });
                          //       },
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                      16.kheightBox,
                      Text(
                        'Add additional info / dietary notes',
                        style: TextStyleUtil.openSans600(
                            fontSize: 16, color: ColorUtil.nblackText),
                      ),
                      8.kheightBox,
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Enter here',
                          fillColor: ColorUtil.whitetText,
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorUtil.whitetrnsprnt),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorUtil.whitetrnsprnt,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorUtil.whitetrnsprnt,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                      40.kheightBox,
                      Row(
                        children: [
                          expandedButton(
                              onPressed: () {
                                Get.offNamed('/reservation-confirmation');
                              },
                              title: 'Create reservation')
                        ],
                      ),
                      16.kheightBox
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget slotChip(
      {String? time,
      bool isselected = false,
      required VoidCallback onTap,
      bool isIcon = true}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isselected ? ColorUtil.nButtonColor : ColorUtil.whitetText,
          border: Border.all(color: ColorUtil.ncircleavatar),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon
                ? Image.asset(
                    ImageConstant.table,
                    color: ColorUtil.nblackText,
                  )
                : SizedBox.shrink(),
            8.kwidthBox,
            Text(
              time!,
              style: TextStyle(
                color: ColorUtil.nblackText,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card nReservationChip({String? title}) {
    return Card(
      elevation: 0,
      color: ColorUtil.whitetText,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Text(
            title!,
            style: TextStyleUtil.openSans600(
                fontSize: 12, color: ColorUtil.nblackText),
          )),
    );
  }
}
