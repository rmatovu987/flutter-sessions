void main() {
  String word = "mum";

  // Prints true
  print(checkIfStringIsPalindrome(word));

  String word1 = "dart";

  // Prints false
  print(checkIfStringIsPalindrome(word1));
}

bool checkIfStringIsPalindrome(String word) {
  // Reverse the word
  String temp = word;
  final chars = temp.split('');
  String reversed_temp = chars.reversed.join('');

  // Compare the word against the reversed temp
  if (reversed_temp == word) {
    return true;
  } else {
    return false;
  }
}
