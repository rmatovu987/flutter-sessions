void main() {
  List a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  printElementsLessThanFive(a);
}

void printElementsLessThanFive(List elements) {
  for (var element in elements) {
    if (element < 5) {
      print(element);
    }
  }
}
