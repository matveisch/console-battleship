import 'dart:io';

void main() {
  List<List<int>> board =
      new List.generate(11, (index) => new List.generate(11, (index) => index));

  board.forEach((row) {
    print(row);
  });
}
