import 'dart:convert';
import 'dart:io';

const String FILEPATH =
    "First assigment - Data types and Variables/birthdays.json";
const JsonDecoder decoder = JsonDecoder();

void main() {
  // Load the json file
  var data = getJsonFile();

  // Extract the months of all birthdays
  Map unique_keys = jsonDecode(data);
  print(unique_keys.keys);

  // Count the number of birthdays per month
  List keys_and_values = data.split(' ');
  keys_and_values.removeWhere((val) => val.isEmpty);

  for (String key in unique_keys.keys) {
    int birthdays = countOccurrencesUsingWhere(keys_and_values, "\"$key\":");
    print("$key has $birthdays birthdays");
  }

  // create list with only month and day values
  List trimmed_keys_and_values = [];
  keys_and_values.forEach((a) {
    var b = a.trim();
    if (!(b.toString() == '{') && !(b.toString() == ']')) {
      if (b.contains('}')) {
        b = b.replaceAll('\n}', '');
      }
      trimmed_keys_and_values.add(
          b.replaceAll('\"', '').replaceAll('\:', '').replaceAll('\,', ''));
    }
  });

  // Create a list of dates
  int i = 0;
  List dates = [];
  while (i <= trimmed_keys_and_values.length - 2) {
    var a = trimmed_keys_and_values[i];
    var b = trimmed_keys_and_values[i + 1];
    dates.add("$a $b");
    i = i + 2;
  }

  //Get highest and lowest month
  int highest = 0;
  int highest_day = 32;
  int lowest = 12;
  int lowest_day = 0;
  String highest_month = "";
  String lowest_month = "";
  dates.forEach((element) {
    String month =
        element.replaceAll(new RegExp('[0-9]'), "").replaceAll(" ", "").trim();

    int day = int.parse(
        element.replaceAll(new RegExp(r"\D"), "").replaceAll(" ", "").trim());

    int month_int = 0;
    switch (month) {
      case "May":
        month_int = 3;
        break;

      case "November":
        month_int = 10;
        break;

      case "December":
        month_int = 11;
        break;

      default:
        print("Invalid choice");
        break;
    }

    if (month_int > highest) {
      highest_month = element;
      highest = month_int;
      highest_day = day;
    } else if (month_int == highest) {
      if (highest_day < day) {
        highest_month = element;
        highest_day = day;
      }
    }

    if (month_int < lowest) {
      lowest_month = element;
      lowest = month_int;
      lowest_day = day;
    } else if (month_int == lowest) {
      if (day < lowest_day) {
        lowest_month = element;
        lowest_day = day;
      }
    }
  });

  // Print the highest and lowest birthdays
  print("The highest birthday is $highest_month");
  print("The lowest birthday is $lowest_month");
}

String getJsonFile() {
  var input = File(FILEPATH).readAsStringSync();
  final data = json.encode(input);
  return json.decode(data);
}

int countOccurrencesUsingWhere(List values, String element) {
  return values.where((e) => e == element).length;
}
