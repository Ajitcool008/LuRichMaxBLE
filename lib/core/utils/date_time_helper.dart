import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Represents the DateTimeHelper class, which encapsulates its respective functionality.
class DateTimeHelper {
/// Defines `"yyyy-MM-dd'T'HH:mm:ss"`, a constant/variable used within the application.
  static const String longFormat = "yyyy-MM-dd'T'HH:mm:ss";
/// Defines `"yyyy-MM-dd'T'HH:mm:ss+0000"`, a constant/variable used within the application.
  static const String longFormatWithTZ = "yyyy-MM-dd'T'HH:mm:ss+0000";
/// Defines `"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"`, a constant/variable used within the application.
  static const String longFormatWithTZUTC = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
/// Defines `dd/MM/yyyy'`, a constant/variable used within the application.
  static const String shortTimeFormat = ' hh:mm a, dd/MM/yyyy';
/// Defines `a'`, a constant/variable used within the application.
  static const String onlyTimeFormat = ' hh:mm a';
/// Defines `a"`, a constant/variable used within the application.
  static const String datewithTime = "dd MMM hh:mm a";
/// Defines `yyyy"`, a constant/variable used within the application.
  static const String datewithMonth = "dd MMM yyyy";
/// Defines `MMM"`, a constant/variable used within the application.
  //static const String datewithMonth = "dd MMM";
/// Defines `'d'`, a constant/variable used within the application.
  static const String dateOnlyFormat = 'd';
/// Defines `'EEEE'`, a constant/variable used within the application.
  static const String dayOnlyFormat = 'EEEE';
/// Defines `'MMMM'`, a constant/variable used within the application.
  static const String monthOnlyFormat = 'MMMM';
/// Defines `'yyyy'`, a constant/variable used within the application.
  static const String yearOnlyFormat = 'yyyy';

  static String stringFromDate(DateTime dateTime,
      {String format = "dd MMM yyyy"}) {
    return DateFormat(format).format(dateTime);
  }

  static DateTime dateFromString(String dateString,
      {String format = "yyyy-MM-dd'T'HH:mm:ssZ", bool isUTC = true}) {
    return DateFormat(format).parse(dateString, isUTC);
  }

  static String getPresentTimeString(
      {String format = longFormat, bool local = false, int? dayAddition}) {
    return stringFromDate(
        local
            ? DateTime.now().add(Duration(days: dayAddition ?? 0))
            : DateTime.now().add(Duration(days: dayAddition ?? 0)),
        format: format);
  }

  static String convertDateFormatIntoLongT(String date) {
    DateTime timecheck = dateFromString(date);

    return DateFormat(longFormatWithTZ).format(timecheck);
  }

  static String convertAnyFormat(
      {required String date, required String format, bool islocal = false}) {
    DateFormat dateFormat = DateFormat(format);
/// Defines `DateTime.parse(date)`, a constant/variable used within the application.
    final dateVal = DateTime.parse(date);
    if (islocal) {
      return dateFormat.format(dateVal);
    } else {
      return dateFormat.format(dateVal);
    }
  }

/// Executes the `convertTo12HourFormat` method, responsible for performing a specific task.
  String convertTo12HourFormat(DateTime timeOfDay) {
    // Create a formatter for 12-hour clock with AM/PM indicator
/// Defines `a')`, a constant/variable used within the application.
    final formatter = DateFormat('h:mm a');
// TimeOfDay timeOfDay = TimeOfDay(hour: 14, minute: 30);  // Time you want to convert
    // DateTime now = DateTime.now();

// Combine into a DateTime object
    // DateTime dateTime = DateTime(
    //     now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    // Convert to string in 12-hour format
    return formatter.format(timeOfDay);

    // Extract hour and minute from the formatted string
/// Defines `formattedTime.split(':')`, a constant/variable used within the application.
    // final parts = formattedTime.split(':');
/// Defines `int.parse(parts[0])`, a constant/variable used within the application.
    // final hour = int.parse(parts[0]);
/// Defines `int.parse(parts[1])`, a constant/variable used within the application.
    // final minute = int.parse(parts[1]);

    // // Adjust hour for AM/PM
/// Defines `12`, a constant/variable used within the application.
    // final adjustedHour = hour % 12 != 0 ? hour % 12 : 12;

    // // Return a new TimeOfDay object in 12-hour format
    // return TimeOfDay(hour: adjustedHour, minute: minute);
  }

  static String changeStringDateFormat(String dateStr,
      {String inDateFormat = longFormat,
      String outDateFormat = datewithTime,
      Duration? addDuration,
      bool isLocal = false}) {
    DateTime inDate = dateFromString(dateStr, format: inDateFormat);

    // Add the duration if provided
    if (addDuration != null) inDate = inDate.add(addDuration);

    // Convert to local time if specified
    if (isLocal) inDate = inDate.toLocal();

    // Return the formatted date string
    return stringFromDate(inDate, format: outDateFormat);
  }

  static String changeDateFormatRequest(DateTime dateStr,
      {String inDateFormat = longFormat,
      outDateFormat = datewithTime,
      Duration? addDuration,
      isLocal = false}) {
    // DateTime inDate = dateFromString(dateStr, format: inDateFormat);
    if (addDuration != null) dateStr = dateStr.add(addDuration);
    if (isLocal) dateStr = dateStr;
    return stringFromDate(dateStr, format: outDateFormat);
  }

  static String getRelativeDisplayTime(String dateStr) {
    DateTime date = dateFromString(dateStr);
    DateTime date2 = DateTime.now();

/// Defines `date2.difference(date).inDays`, a constant/variable used within the application.
    var diff = date2.difference(date).inDays;
    if (diff > 1) {
      return DateTimeHelper.changeStringDateFormat(dateStr);
    } else if (diff == 1) {
      return "Yesterday";
    }

    return timeago.format(date, clock: date2);
  }

/// Executes the `getHashCode` method, responsible for performing a specific task.
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}