import 'dart:io';

void main() {
  Set<List<List<int>>> board = createBoard(10);

  printBoard(board);
}

Set<List<List<int>>> createBoard(int size) =>
    {new List.generate(size, (index) => new List.generate(size, (index) => 0))};

void printBoard(Set<List<List<int>>> board) {
  board.forEach((row) {
    row.forEach((element) {
      print(element.join());
    });
  });
}
