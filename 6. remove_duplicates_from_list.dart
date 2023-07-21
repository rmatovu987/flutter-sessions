void main() {
  List a = [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 9, 2, 6, 4, 2];

  print(removeDuplicates(a));
}

Set removeDuplicates(List a) {
  return a.toSet();
}
