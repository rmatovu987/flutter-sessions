void main() {
  List a = [5, 10, 15, 20, 25];

  print(createListWithFirstAndLastElements(a));
}

List createListWithFirstAndLastElements(List list) {
  List c = [];
  for (int i = 0; i < list.length; i++) {
    if (i == 0 || i == list.length - 1) {
      c.add(list[i]);
    }
  }
  return c;
}
