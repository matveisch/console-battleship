import 'dart:io';

void main() {
  List<List<int>> board = new List.generate(
      10, (index) => new List.generate(10, (index) => index++));

  board.forEach((row) {
    print(row);
  });
}
