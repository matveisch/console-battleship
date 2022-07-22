import 'dart:io';

void main() {
  List<List> numbers = [
    [0, 1, 2, 3],
    []
  ];

  numbers.forEach((element) {
    printNumber(element);
  });
}

void printNumber(List num) {
  print(num);
}
