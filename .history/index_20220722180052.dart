import 'dart:io';

void main() {
  List<List<int>> board = new List.generate(10, (index) => []);

  board.forEach((element) {
    printNumber(element);
  });
}

void printNumber(List num) {
  print(num);
}
