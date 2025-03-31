import 'dart:collection';

import 'package:get/get.dart';
import 'package:lurichmaxble/src/modules/create_request/models/time_interval_request.dart';
import 'package:lurichmaxble/src/utils/date_time_helper.dart';
import 'package:table_calendar/table_calendar.dart';

class CreateFormsController extends GetxController {
  final List<String> _forms = [
    "Requesting for Service",
    "Choose a Task",
    "Date and Time",
    "Wages and Charges",
    "Work Services",
  ];

  RxBool isRefresh = false.obs;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOff;

  /// Executes the `LinkedHashSet<DateTime>` method, responsible for performing a specific task.
  Set<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: DateTimeHelper().getHashCode,
  );

  RxList<ScheduleItem> dateScheduleList = <ScheduleItem>[].obs;

  DateTime? rangeStart;
  DateTime? rangeEnd;

  DateTime focusedDay = DateTime.now();

  RxList<DurationItem> allSelectedDurations =
      [
        DurationItem(
          startTime: DateTime(0, 0, 0, 9, 0), // Default start time 9:00 AM
          endTime: DateTime(0, 0, 0, 17, 0),
        ), // Default end time 5:00 PM
      ].obs;

  List<DateTime> selectedDates = [];

  RxBool specifyEachDay = true.obs;

  final kToday = DateTime.now();

  /// Executes the `getSelectedDateRange` method, responsible for performing a specific task.
  List<DateTime> getSelectedDateRange() {
    /// Defines `[]`, a constant/variable used within the application.
    final List<DateTime> dateList = [];
    if (rangeEnd != null && rangeStart != null) {
      /// Defines `{`, a constant/variable used within the application.
      for (var i = 0; i <= rangeEnd!.difference(rangeStart!).inDays; i++) {
        dateList.add(rangeStart!.add(Duration(days: i)));
      }
    } else {
      dateList.addAll(selectedDays.toList());
    }
    return dateList;
  }

  createScheduleDates() {
    List<DateTime> dateList = getSelectedDateRange();
    for (var j = 0; j < dateList.length; j++) {
      dateScheduleList.add(
        ScheduleItem(
          dateSel: dateList[j],
          date: DateTimeHelper.changeDateFormatRequest(
            dateList[j],
            outDateFormat: DateTimeHelper.longFormatWithTZUTC,
          ),
          durations: [
            DurationItem(
              startTime: DateTime(
                dateList[j].year,
                dateList[j].month,
                dateList[j].day,
                9,
                0,
              ), // 9:00 AM default start time
              endTime: DateTime(
                dateList[j].year,
                dateList[j].month,
                dateList[j].day,
                17,
                0,
              ),
            ), // 5:00 PM default end time
          ],
        ),
      );
    }
  }

  /// Executes the `onDaySelected` method, responsible for performing a specific task.
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    focusedDay = focusedDay;
    if (selectedDays.contains(selectedDay)) {
      selectedDays.remove(selectedDay);
      dateScheduleList.removeWhere((element) => element.dateSel == selectedDay);
    } else {
      selectedDays.add(selectedDay);
      dateScheduleList.add(
        ScheduleItem(
          dateSel: selectedDay,
          date: DateTimeHelper.changeDateFormatRequest(
            selectedDay,
            outDateFormat: DateTimeHelper.longFormatWithTZUTC,
          ),
          durations: [
            DurationItem(
              startTime: DateTime(
                selectedDay.year,
                selectedDay.month,
                selectedDay.day,
                9,
                0,
              ),
              endTime: DateTime(
                selectedDay.year,
                selectedDay.month,
                selectedDay.day,
                17,
                0,
              ),
            ),
          ],
        ),
      );
    }
    isRefresh.value = !isRefresh.value;
  }

  /// Executes the `onDayRangeSelected` method, responsible for performing a specific task.
  void onDayRangeSelected(DateTime selectedDay, DateTime focuseddDay) {
    // if (!isSameDay(
    //     con.selectedDates, selectedDay)) {
    //   con.selectedDates = selectedDay;
    focusedDay = focuseddDay;

    rangeStart = null; // Important to clean those
    rangeEnd = null;
    isRefresh.value = !isRefresh.value;
    // con.rangeSelectionMode =
    //     RangeSelectionMode.toggledOff;
    // }
  }

  addIntervalsDurations() {
    allSelectedDurations.add(
      DurationItem(
        startTime: DateTime(
          dateScheduleList.first.dateSel.year,
          dateScheduleList.first.dateSel.month,
          dateScheduleList.first.dateSel.day,
          9,
          0,
        ), // Default start 9:00 AM
        endTime: DateTime(
          dateScheduleList.first.dateSel.year,
          dateScheduleList.first.dateSel.month,
          dateScheduleList.first.dateSel.day,
          17,
          0,
        ),
      ),
    ); // Default end 5:00 PM
  }

  resetIntervals() {
    allSelectedDurations.clear();
    allSelectedDurations.add(
      DurationItem(
        startTime: DateTime(
          dateScheduleList.first.dateSel.year,
          dateScheduleList.first.dateSel.month,
          dateScheduleList.first.dateSel.day,
          9,
          0,
        ), // Default start 9:00 AM
        endTime: DateTime(
          dateScheduleList.first.dateSel.year,
          dateScheduleList.first.dateSel.month,
          dateScheduleList.first.dateSel.day,
          17,
          0,
        ),
      ),
    ); // Default end 5:00 PM
    for (var i = 0; i < dateScheduleList.length; i++) {
      dateScheduleList[i].durations.clear();
      dateScheduleList[i].durations.add(
        DurationItem(
          startTime: DateTime(
            dateScheduleList[i].dateSel.year,
            dateScheduleList[i].dateSel.month,
            dateScheduleList[i].dateSel.day,
            9,
            0,
          ),
          endTime: DateTime(
            dateScheduleList[i].dateSel.year,
            dateScheduleList[i].dateSel.month,
            dateScheduleList[i].dateSel.day,
            17,
            0,
          ),
        ),
      );
    }
  }

  List<String> get forms => _forms;
}
