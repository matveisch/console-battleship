import 'dart:io';

void main() {
  // creating 11x11 board, including one row and one column for coordinates
  Set<List<List<int>>> board = createBoard(11);

  // setting coordinates – instead of first row
  for (int i = 0; i < board.first[0].length; i++) {
    board.first[0][i] = i;
  }

  // setting coordinates – instaed of first column
  for (int i = 0; i < board.first[0].length; i++) {
    board.first[i][0] = i;
  }

  print(board.first[1][1] = 5);

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
