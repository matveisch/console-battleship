import 'lib/Ship.dart';

void main() {
  // creating 11x11 board, including one row and one column for coordinates
  Set<List<List<int>>> myBoard = createBoard(11);
  Set<List<List<int>>> enemyBoard = createBoard(11);

  // setting coordinates for myBoard
  setCoordinates(myBoard, 'row');
  setCoordinates(myBoard, 'col');

  // setting coordinates for enenemy's board
  setCoordinates(enemyBoard, 'row');
  setCoordinates(enemyBoard, 'col');

  printBothBoards(myBoard, enemyBoard);

  Ship twoDeckShip = new Ship(3, 'y', {'x': 1, 'y': 1});
  twoDeckShip.fillUpCoordinates();
  print(twoDeckShip.coordinatesOnBoard);
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

void printBothBoards(
    Set<List<List<int>>> myBoard, Set<List<List<int>>> enemyBoard) {
  print('my board');
  printBoard(myBoard);
  print('\n');
  print('enemys board');
  printBoard(enemyBoard);
}

// function that sets coordinates (either for the rows or columns)
void setCoordinates(Set<List<List<int>>> board, String type) {
  for (int i = 0; i < board.first[0].length; i++) {
    board.first[type == 'row' ? 0 : i][type == 'row' ? i : 0] = i;
  }
}
