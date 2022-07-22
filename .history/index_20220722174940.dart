import 'dart:io';

void main() {
  List<int> numbers = [1, 2, 3];

  numbers.forEach((element) {
    printNumber(element);
  });
}

void printNumber(int num) {
  print(num);
}
