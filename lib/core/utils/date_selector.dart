import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lurichmaxble/core/constants/theme_constants.dart';
import 'package:lurichmaxble/app/modules/create_request/controllers/form_controller.dart';
import 'package:lurichmaxble/app/modules/create_request/models/time_interval_request.dart';
import 'package:lurichmaxble/core/utils/app_snackbar.dart';
import 'package:lurichmaxble/core/utils/date_time_helper.dart';
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
              if (!con.specifyEachDay.value) ...{
                TimeSelectionInterval(con: con),
              } else ...{
                DateTimeSelectionInterval(con: con),
              },
            },
          ],
        ),
      );
    });
  }
}

/// Represents the TimeSelectionInterval class, which encapsulates its respective functionality.
class TimeSelectionInterval extends StatelessWidget {
  final CreateFormsController con;

  /// Defines `this.con})`, a constant/variable used within the application.
  const TimeSelectionInterval({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      debugPrint(con.isRefresh.value.toString());
      return Column(
        children: [
          /// Executes the `ListView.builder` method, responsible for performing a specific task.
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: con.allSelectedDurations.length,
            itemBuilder: (context, index) {
              /// Defines `con.allSelectedDurations[index]`, a constant/variable used within the application.
              // final durationItem = con.allSelectedDurations[index];
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Times",
                    style: TextStyle(
                      // color: Color(0xff020200),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        final selectedTime = await showTimePicker(
                          initialEntryMode: TimePickerEntryMode.inputOnly,
                          context: context,
                          initialTime: TimeOfDay(
                            hour:
                                con.allSelectedDurations[index].startTime.hour,
                            minute:
                                con
                                    .allSelectedDurations[index]
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
                            con.dateScheduleList.first.dateSel.year,
                            con.dateScheduleList.first.dateSel.month,
                            con.dateScheduleList.first.dateSel.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );

                          final DateTime endDateTime = DateTime(
                            con.dateScheduleList.first.dateSel.year,
                            con.dateScheduleList.first.dateSel.month,
                            con.dateScheduleList.first.dateSel.day,
                            con.allSelectedDurations[index].endTime.hour,
                            con.allSelectedDurations[index].endTime.minute,
                          );
                          if (startDateTime.isBefore(endDateTime)) {
                            con.allSelectedDurations[index].startTime =
                                startDateTime;
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
                        // backgroundColor: WidgetStateProperty.all<Color>(
                        //   Colors.black,
                        // ), // Button background color
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
                          con.allSelectedDurations[index].startTime,
                        ),
                        // '${con.allSelectedDurations[index].startTime.hour}:${con.allSelectedDurations[index].startTime.minute}',
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
                            FontWeight.bold, // Adjust the font weight as needed
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
                            hour: con.allSelectedDurations[index].endTime.hour,
                            minute:
                                con.allSelectedDurations[index].endTime.minute,
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
                            con.dateScheduleList.first.dateSel.year,
                            con.dateScheduleList.first.dateSel.month,
                            con.dateScheduleList.first.dateSel.day,
                            con.allSelectedDurations[index].startTime.hour,
                            con.allSelectedDurations[index].startTime.minute,
                          );

                          final DateTime endDateTime = DateTime(
                            con.dateScheduleList.first.dateSel.year,
                            con.dateScheduleList.first.dateSel.month,
                            con.dateScheduleList.first.dateSel.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                          if (endDateTime.isAfter(startDateTime)) {
                            con.allSelectedDurations[index].endTime =
                                endDateTime;
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
                          Colors.black,
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
                          con.allSelectedDurations[index].endTime,
                        ),
                        // '${con.allSelectedDurations[index].endTime.hour}:${con.allSelectedDurations[index].endTime.minute}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ), // Text color
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      if (index != 0) {
                        con.allSelectedDurations.removeAt(index);
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
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    /// Executes the `WidgetStateProperty.all<Color>` method, responsible for performing a specific task.
                    WidgetStateProperty.all<Color>(const Color(0xff012426)),
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .zero, // Set borderRadius to zero for rectangular shape
                      ),
                    ),
                  ),
                  onPressed: () {
                    con.addIntervalsDurations();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Theme.of(context).primaryColor),
                      Text(
                        "Add Interval",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

/// Represents the CustomScheduleDialog class, which encapsulates its respective functionality.
class CustomScheduleDialog extends StatelessWidget {
  /// Defines `header`, a constant/variable used within the application.
  final String header;

  /// Defines `subHeader`, a constant/variable used within the application.
  final String subHeader;
  const CustomScheduleDialog({
    super.key,
    required this.header,
    required this.subHeader,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      // actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      title: Icon(Icons.warning_amber_outlined),
      // title: Text("Delete Account"),
      content: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        width: MediaQuery.sizeOf(context).width * 0.99,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              header,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            if (subHeader.isNotEmpty) ...{
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.99,
                child: Text(
                  subHeader,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                    // color: Color(0xff61615A)
                  ),
                ),
              ),
            },
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // Return false when cancelled
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // Container(height: 30, child: VerticalDivider(color: Color(0xff74746E))),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // Return true when confirmed
          },
          child: Text(
            "Ok",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Service",
                      border: OutlineInputBorder(),
                    ),
                  ),
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
                      shape: WidgetStateProperty.all<OutlinedBorder>(
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
