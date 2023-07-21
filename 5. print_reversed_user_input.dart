import 'dart:io';

void main() {
  String user_input = stdin.readLineSync().toString();
  print(reverseUserInput(user_input));
}

String reverseUserInput(String user_input) {
  // Convert the user input into a list of strings
  List<String> user_list = user_input.split(' ');

  return user_list.reversed.join(' ');
}
