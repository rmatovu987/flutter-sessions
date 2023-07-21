import 'dart:convert';
import 'dart:io';

const String FILEPATH = "birthdays.json";
const JsonDecoder decoder = JsonDecoder();

void main() {
  // Load the json file
  var data = getJsonFile();

  // Extract the months of all birthdays
  Map unique_keys = jsonDecode(data);
  print(unique_keys.keys);

  // Count the number of birthdays per month
  List<String> keys_and_values = data.split(' ');
  for (String key in unique_keys.keys) {
    int birthdays = countOccurrencesUsingWhere(keys_and_values, "\"$key\":");
    print("$key has $birthdays birthdays");
  }
}

String getJsonFile() {
  var input = File(FILEPATH).readAsStringSync();
  final data = json.encode(input);
  return json.decode(data);
}

int countOccurrencesUsingWhere(List<String> values, String element) {
  return values.where((e) => e == element).length;
}
