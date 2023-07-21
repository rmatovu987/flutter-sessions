void main() {
    List a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
    List b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

    print(returnCommonUniqueElements(a, b));
}

List returnCommonUniqueElements(List a, List b){
    List c = [];
    for(var element in a){
        if(b.contains(element) && !c.contains(element)){
            c.add(element);
        }
    }

    return c;
}