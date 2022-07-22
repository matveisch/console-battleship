import 'dart:io';

void main() {
  List<List<int>> board = new List.generate(length, (index) => null)

  board.forEach((element) {
    printNumber(element);
  });
}

void printNumber(List num) {
  print(num);
}
