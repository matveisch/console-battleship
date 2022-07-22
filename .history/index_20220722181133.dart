import 'dart:io';

void main() {
  List<List<int>> board =
      new List.generate(11, (index) => new List.generate(11, (index) => 0));

  board.forEach((row) {
    print(row);
  });
}

Set<List<List<int>>> createBoard() => {
  return new List.generate(11, (index) => new List.generate(11, (index) => 0));
};
