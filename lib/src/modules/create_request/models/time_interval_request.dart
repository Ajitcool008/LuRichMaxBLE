import 'package:flutter/foundation.dart';

/// Represents the ScheduleRequest class, which encapsulates its respective functionality.
class ScheduleRequest {
  List<ScheduleItem> schedule;

  ScheduleRequest({
    required this.schedule,
  });

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) {
    return ScheduleRequest(
      schedule: (json['schedule'] as List<dynamic>)
          .map((item) => ScheduleItem.fromJson(item))
          .toList(),
    );
  }

/// Executes the `toJson` method, responsible for performing a specific task.
  Map<String, dynamic> toJson() {
    return {
      'schedule': schedule.map((item) => item.toJson()).toList(),
    };
  }
}

/// Represents the ScheduleItem class, which encapsulates its respective functionality.
class ScheduleItem {
  String date;
  DateTime dateSel;
/// Defines `durations`, a constant/variable used within the application.
  final List<DurationItem> durations;

  ScheduleItem({
    required this.date,
    required this.dateSel,
    required this.durations,
  });

  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      date: json['date'],
      dateSel: DateTime.parse(json['date']),
      durations: (json['durations'] as List<dynamic>)
          .map((item) => DurationItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
/// Defines `DateTime.parse(date)`, a constant/variable used within the application.
    var dateUTC = DateTime.parse(date);
/// Executes the `dateUTC.toIso8601String` method, responsible for performing a specific task.
    String formattedDate = dateUTC.toIso8601String();
    return {
      'date': formattedDate,
      // 'dateSel': dateSel.toIso8601String(),
      'durations': durations.map((item) => item.toJson()).toList(),
    };
  }

  @override
/// Executes the `==` method, responsible for performing a specific task.
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduleItem &&
        other.date == date &&
        other.dateSel == dateSel &&
        listEquals(other.durations, durations);
  }

  @override
/// Executes the `Object.hash` method, responsible for performing a specific task.
  int get hashCode => Object.hash(date, dateSel, durations);
}

/// Represents the DurationItem class, which encapsulates its respective functionality.
class DurationItem {
  DateTime startTime;
  DateTime endTime;

  DurationItem({
    required this.startTime,
    required this.endTime,
  });

  factory DurationItem.fromJson(Map<String, dynamic> json) {
    return DurationItem(
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    // Get current date
    // DateTime now = DateTime.now();

    // // Construct DateTime objects using today's date
    // DateTime startDateTime = DateTime(
    //   now.year,
    //   now.month,
    //   now.day,
    //   startTime.hour,
    //   startTime.minute,
    // );
    // DateTime endDateTime = DateTime(
    //   now.year,
    //   now.month,
    //   now.day,
    //   endTime.hour,
    //   endTime.minute,
    // );

    // Convert DateTime to formatted strings
/// Executes the `startTime.toIso8601String` method, responsible for performing a specific task.
    String formattedStartTime = startTime.toIso8601String();
/// Executes the `endTime.toIso8601String` method, responsible for performing a specific task.
    String formattedEndTime = endTime.toIso8601String();

    return {
      'startTime': formattedStartTime,
      'endTime': formattedEndTime,
    };
    // Map<String, dynamic> toJson() {
    //   return {
    //     'startTime': '${startTime.hour}:${startTime.minute}',
    //     'endTime': '${endTime.hour}:${endTime.minute}',
    //   };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DurationItem &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => Object.hash(startTime, endTime);
}