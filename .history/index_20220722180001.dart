import 'dart:io';

void main() {
  List<List<int>> board = [
    [0, 1, 2, 3],
    []
  ];

  board.forEach((element) {
    printNumber(element);
  });
}

void printNumber(List num) {
  print(num);
}
