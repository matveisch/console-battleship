import 'dart:io';

void main() {
  Set<List<List<int>>> board = createBoard(11);

  for (int i = 0; i < board.first[0].length; i++) {
    board.first[0][i] = i;
  }

  for (int i = 0; i < board.first[0].length; i++) {
    for (int j = 0; j <= 10; j++) {
      board.first[i][j] = j;
    }
  }

  printBoard(board);
}

Set<List<List<int>>> createBoard(int size) =>
    {new List.generate(size, (index) => new List.generate(size, (index) => 0))};

void printBoard(Set<List<List<int>>> board) {
  board.forEach((row) {
    row.forEach((element) {
      print(element.join(' '));
    });
  });
}
