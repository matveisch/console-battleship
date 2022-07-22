import 'dart:io';

void main() {
  List<List<int>> board =
      new List.generate(10, (index) => new List.generate(10, (index) => 0));

  // board.forEach((row) {
  //   print(row);
  // });

  print(board);
}
