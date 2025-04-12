import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/components/common_autocomplete_testfield.dart';
import 'package:lurichmaxble/constants/theme_constants.dart';
import 'package:lurichmaxble/src/modules/create_request/controllers/form_controller.dart';
import 'package:lurichmaxble/src/modules/create_request/models/time_interval_request.dart';
import 'package:lurichmaxble/src/utils/app_snackbar.dart';
import 'package:lurichmaxble/src/utils/date_time_helper.dart';
import 'package:table_calendar/table_calendar.dart';

/// Represents the CreateEventSecondPage class, which encapsulates its respective functionality.
class CreateEventSecondPage extends StatelessWidget {
  const CreateEventSecondPage({
    super.key,
    required this.con,
    required this.kToday,
  });

  /// Defines `con`, a constant/variable used within the application.
  final CreateFormsController con;

  /// Defines `kToday`, a constant/variable used within the application.
  final DateTime kToday;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      debugPrint(con.isRefresh.value.toString());
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dates",
                  style: TextStyle(
                    // color: Color(0xff020200),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Row(
                //   children: [
                //     const Text("Select a Date Range: "),
                //     Switch(
                //       activeColor: const Color(0xff03B4BF),
                //       value:
                //           con.rangeSelectionMode ==
                //           RangeSelectionMode.toggledOn,
                //       onChanged: (value) async {
                //         if (con.selectedDays.isNotEmpty ||
                //             con.dateScheduleList.isNotEmpty) {
                //           /// Executes the `showDialog` method, responsible for performing a specific task.
                //           bool confirmDelete = await showDialog(
                //             context: context,
                //             builder:
                //                 (context) => CustomScheduleDialog(
                //                   header:
                //                       value
                //                           ? "If you use Select a Date Range it will remove all exisitng Date/Times. Do you wish to proceed?"
                //                           : "If you turn Select a Date Range off, it will remove all exisitng Date/Times. Do you wish to proceed?",
                //                   subHeader: "",
                //                 ),
                //           );
                //           if (confirmDelete) {
                //             if (!value) {
                //               con.rangeSelectionMode =
                //                   RangeSelectionMode.toggledOff;
                //             } else {
                //               con.rangeSelectionMode =
                //                   RangeSelectionMode.toggledOn;
                //             }
                //             con.selectedDays.clear();
                //             con.dateScheduleList.clear();
                //             con.rangeStart = null; // Important to clean those
                //             con.rangeEnd = null;
                //             con.isRefresh.value = !con.isRefresh.value;
                //           }
                //         } else {
                //           if (!value) {
                //             con.rangeSelectionMode =
                //                 RangeSelectionMode.toggledOff;
                //           } else {
                //             con.rangeSelectionMode =
                //                 RangeSelectionMode.toggledOn;
                //           }
                //           con.selectedDays.clear();
                //           con.dateScheduleList.clear();
                //           con.rangeStart = null; // Important to clean those
                //           con.rangeEnd = null;
                //           con.isRefresh.value = !con.isRefresh.value;
                //         }
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
            Stack(
              children: [
                TableCalendar(
                  calendarStyle: const CalendarStyle(
                    rangeHighlightColor: ThemeHelper.primaryBlue,
                    rangeStartDecoration: BoxDecoration(
                      color: ThemeHelper.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    rangeEndDecoration: BoxDecoration(
                      color: ThemeHelper.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(color: Colors.transparent),
                    selectedTextStyle: TextStyle(
                      // backgroundColor: ,
                      backgroundColor: ThemeHelper.primaryBlue,
                    ),
                    markerDecoration: BoxDecoration(
                      color: ThemeHelper.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: ThemeHelper.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  firstDay: DateTime(kToday.year, kToday.month, kToday.day),
                  lastDay: DateTime(kToday.year + 99, kToday.month, kToday.day),
                  focusedDay: con.focusedDay,

                  selectedDayPredicate: (day) {
                    // if (con.rangeSelectionMode !=
                    //     RangeSelectionMode.toggledOn) {
                    //   // return isSameDay(
                    //   //     con.selectedDates, day);
                    // } else {
                    return con.selectedDays.contains(day);
                    // }
                  },

                  rangeStartDay: con.rangeStart,
                  rangeEndDay: con.rangeEnd,
                  // calendarFormat: _calendarFormat,
                  rangeSelectionMode: con.rangeSelectionMode,
                  onDaySelected:
                      con.rangeSelectionMode != RangeSelectionMode.toggledOn
                          ? con.onDaySelected
                          : con.onDayRangeSelected,

                  onRangeSelected: (start, end, focusedDay) {
                    con.selectedDates = [];
                    con.focusedDay = focusedDay;
                    con.rangeStart = start;
                    con.rangeEnd = end;
                    con.dateScheduleList.clear();
                    con.createScheduleDates();
                    con.isRefresh.value = !con.isRefresh.value;
                    // con.rangeSelectionMode =
                    //     RangeSelectionMode.toggledOn;
                  },
                  onFormatChanged: (format) {
                    // if (_calendarFormat != format) {
                    //   setState(() {
                    //     _calendarFormat = format;
                    //   });
                    // }
                  },
                  onPageChanged: (focusedDay) {
                    con.focusedDay = focusedDay;
                  },
                ),
                Positioned(
                  top: Get.height * 0.02,
                  right: Get.width * 0.16,
                  child: Container(
                    height: 40,
                    width: 80,
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Row(
                //   children: [
                //     const Text("Set Times for Each Date: "),
                //     Switch(
                //       activeColor: const Color(0xff03B4BF),
                //       value: con.specifyEachDay.value,
                //       onChanged: (value) async {
                //         if (con.specifyEachDay.value) {
                //           bool confirmDelete = await showDialog(
                //             context: context,
                //             builder:
                //                 (context) => CustomScheduleDialog(
                //                   header:
                //                       "If you turn Set Times for Each Date off, you will lose any times previously set. Do you wish to continue?",
                //                   subHeader: "",
                //                 ),
                //           );
                //           if (confirmDelete) {
                //             con.specifyEachDay.value =
                //                 !con.specifyEachDay.value;
                //             con.resetIntervals();
                //           }
                //         } else {
                //           con.specifyEachDay.value = !con.specifyEachDay.value;
                //           con.resetIntervals();
                //         }
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
            if (con.dateScheduleList.isNotEmpty) ...{
              DateTimeSelectionInterval(con: con),
            },
          ],
        ),
      );
    });
  }
}

/// Represents the DateTimeSelectionInterval class, which encapsulates its respective functionality.
class DateTimeSelectionInterval extends StatelessWidget {
  final CreateFormsController con;
  const DateTimeSelectionInterval({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      debugPrint(con.isRefresh.value.toString());
      return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: con.dateScheduleList.length,
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    DateTimeHelper.changeStringDateFormat(
                      con.dateScheduleList[position].date,
                      outDateFormat: "dd MMM yyyy",
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: CustomAutocompleteTextField(
                          options: [
                            "Delivery",
                            "Pickup",
                            "Service",
                            "Appointment",
                            "Event",
                            "Inspection",
                          ],
                          controller: TextEditingController(),
                          hintText: "Service(s)",
                          onSelected: (String selected) {
                            // Handle selection
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 16,
                        ),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: const Text(
                    "Time",
                    style: TextStyle(
                      // color: Color(0xff020200),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: con.dateScheduleList[position].durations.length,
                  itemBuilder: (context, index) {
                    //  con.dateScheduleList[position].durations[index];
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 35),
                        Expanded(
                          child: TextButton(
                            onPressed: () async {
                              final selectedTime = await showTimePicker(
                                initialEntryMode: TimePickerEntryMode.inputOnly,
                                context: context,
                                initialTime: TimeOfDay(
                                  hour:
                                      con
                                          .dateScheduleList[position]
                                          .durations[index]
                                          .startTime
                                          .hour,
                                  minute:
                                      con
                                          .dateScheduleList[position]
                                          .durations[index]
                                          .startTime
                                          .minute,
                                ),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: const ColorScheme.light(
                                        // change the border color
                                        primary: Colors.blue,
                                        // change the text color
                                        // onSurface: Colors.black,
                                      ),
                                      // button colors
                                      buttonTheme: const ButtonThemeData(
                                        colorScheme: ColorScheme.light(
                                          primary: Colors.green,
                                        ),
                                      ),
                                    ),
                                    child: MediaQuery(
                                      data: MediaQuery.of(
                                        context,
                                      ).copyWith(alwaysUse24HourFormat: false),
                                      child: child!,
                                    ),
                                  );
                                },
                              );
                              if (selectedTime != null) {
                                final DateTime startDateTime = DateTime(
                                  0,
                                  0,
                                  0,
                                  selectedTime.hour,
                                  selectedTime.minute,
                                );

                                final DateTime endDateTime = DateTime(
                                  0,
                                  0,
                                  0,
                                  con
                                      .dateScheduleList[position]
                                      .durations[index]
                                      .endTime
                                      .hour,
                                  con
                                      .dateScheduleList[position]
                                      .durations[index]
                                      .endTime
                                      .minute,
                                );
                                if (startDateTime.isBefore(endDateTime)) {
                                  con
                                      .dateScheduleList[position]
                                      .durations[index]
                                      .startTime = DateTime(
                                    con.dateScheduleList[position].dateSel.year,
                                    con
                                        .dateScheduleList[position]
                                        .dateSel
                                        .month,
                                    con.dateScheduleList[position].dateSel.day,
                                    selectedTime.hour,
                                    selectedTime.minute,
                                  );
                                  con.isRefresh.value = !con.isRefresh.value;
                                } else {
                                  AppSnackbar.showSnackbar(
                                    "Information",
                                    "Start time should be before end time",
                                    AlertType.info,
                                    position: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 2),
                                  );
                                }
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.white,
                              ), // Button background color
                              shape:
                              /// Executes the `WidgetStateProperty.all<OutlinedBorder>` method, responsible for performing a specific task.
                              WidgetStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ), // Button border radius
                                ),
                              ),
                            ),
                            child: Text(
                              DateTimeHelper().convertTo12HourFormat(
                                con
                                    .dateScheduleList[position]
                                    .durations[index]
                                    .startTime,
                              ),
                              // '${con.dateScheduleList[position].durations[index].startTime.hour}:${con.dateScheduleList[position].durations[index].startTime.minute}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ), // Text color
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            "–", // Long hyphen character
                            style: TextStyle(
                              fontSize: 22, // Adjust the font size as needed
                              fontWeight:
                                  FontWeight
                                      .bold, // Adjust the font weight as needed
                            ),
                          ),
                        ), // Add some spacing between buttons
                        Expanded(
                          child: TextButton(
                            onPressed: () async {
                              final selectedTime = await showTimePicker(
                                initialEntryMode: TimePickerEntryMode.inputOnly,
                                context: context,
                                initialTime: TimeOfDay(
                                  hour:
                                      con
                                          .dateScheduleList[position]
                                          .durations[index]
                                          .endTime
                                          .hour,
                                  minute:
                                      con
                                          .dateScheduleList[position]
                                          .durations[index]
                                          .endTime
                                          .minute,
                                ),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: const ColorScheme.light(
                                        // change the border color
                                        primary: Colors.blue,
                                        // change the text color
                                        onSurface: Colors.black,
                                      ),
                                      // button colors
                                      buttonTheme: const ButtonThemeData(
                                        colorScheme: ColorScheme.light(
                                          primary: Colors.green,
                                        ),
                                      ),
                                    ),
                                    child: MediaQuery(
                                      data: MediaQuery.of(
                                        context,
                                      ).copyWith(alwaysUse24HourFormat: false),
                                      child: child!,
                                    ),
                                  );
                                },
                              );
                              if (selectedTime != null) {
                                final DateTime startDateTime = DateTime(
                                  0,
                                  0,
                                  0,
                                  con
                                      .dateScheduleList[position]
                                      .durations[index]
                                      .startTime
                                      .hour,
                                  con
                                      .dateScheduleList[position]
                                      .durations[index]
                                      .startTime
                                      .minute,
                                );

                                final DateTime endDateTime = DateTime(
                                  0,
                                  0,
                                  0,
                                  selectedTime.hour,
                                  selectedTime.minute,
                                );
                                if (endDateTime.isAfter(startDateTime)) {
                                  con
                                      .dateScheduleList[position]
                                      .durations[index]
                                      .endTime = DateTime(
                                    con.dateScheduleList[position].dateSel.year,
                                    con
                                        .dateScheduleList[position]
                                        .dateSel
                                        .month,
                                    con.dateScheduleList[position].dateSel.day,
                                    selectedTime.hour,
                                    selectedTime.minute,
                                  );
                                  con.isRefresh.value = !con.isRefresh.value;
                                } else {
                                  AppSnackbar.showSnackbar(
                                    "Information",
                                    "End time should be greater then start time",
                                    AlertType.info,
                                    position: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 2),
                                  );
                                }
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.white,
                              ), // Button background color
                              shape: WidgetStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ), // Button border radius
                                ),
                              ),
                            ),
                            child: Text(
                              DateTimeHelper().convertTo12HourFormat(
                                con
                                    .dateScheduleList[position]
                                    .durations[index]
                                    .endTime,
                              ),
                              // '${con.dateScheduleList[position].durations[index].endTime.hour}:${con.dateScheduleList[position].durations[index].endTime.minute}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ), // Text color
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (index != 0) {
                              con.dateScheduleList[position].durations.removeAt(
                                index,
                              );
                              con.dateScheduleList.refresh();
                            } else {
                              AppSnackbar.showSnackbar(
                                "Information",
                                "It's not deletable",
                                AlertType.info,
                                position: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 2),
                              );
                            }
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 10,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all<Color>(
                      //   const Color(0xff012426),
                      // ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .zero, // Set borderRadius to zero for rectangular shape
                        ),
                      ),
                    ),
                    onPressed: () {
                      con.dateScheduleList[position].durations.add(
                        DurationItem(
                          startTime: DateTime(
                            con.dateScheduleList[position].dateSel.year,
                            con.dateScheduleList[position].dateSel.month,
                            con.dateScheduleList[position].dateSel.day,
                            00,
                            01,
                          ),
                          endTime: DateTime(
                            con.dateScheduleList[position].dateSel.year,
                            con.dateScheduleList[position].dateSel.month,
                            con.dateScheduleList[position].dateSel.day,
                            23,
                            59,
                          ),
                        ),
                      );
                      con.dateScheduleList.refresh();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Theme.of(context).primaryColor),
                        Text(
                          "Add Interval",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
