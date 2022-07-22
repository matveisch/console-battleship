import 'dart:io';

void main() {
  List<List<int>> board = createBoard(10);

  board.forEach((row) {
    print(row);
  });
}

Set<List<List<int>>> createBoard(int size) =>
    {new List.generate(size, (index) => new List.generate(size, (index) => 0))};
