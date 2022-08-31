import 'package:intl/intl.dart';

class MyDateUtils{
  static String formatNewsDate(String inputDateString){
    DateFormat inputFormatter = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    DateFormat outputFormatter = DateFormat('yyyy MMM dd HH:mma');
    DateTime inputDate = inputFormatter.parse(inputDateString);
    return outputFormatter.format(inputDate);
  }
}