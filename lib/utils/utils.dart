
import 'package:intl/intl.dart';
String compareAndCombineIds(String userID1, String userID2) {
  if (userID1.compareTo(userID2) < 0) {
    return userID2 + userID1;
  } else {
    return userID1 + userID2;
  }
}
String convertEpochMsToDateTime(int epochMs) {
  int oneDayInMs = 86400000;
  var date = DateTime.fromMillisecondsSinceEpoch(epochMs);
  int currentTimeMs = DateTime.now().millisecondsSinceEpoch;
  if ((currentTimeMs - epochMs) >= oneDayInMs) {
    return '${DateFormat.yMd().format(date)}  ${DateFormat.jm().format(date)}';
  } else {
    return DateFormat.jm().format(date);
  }
}