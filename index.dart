import 'lib/Ship.dart';
import 'lib/Board.dart';

void main() {
  // creating 11x11 board, including one row and one column for coordinates
  Board myBoard = new Board(11);
  myBoard.createBoard();
  myBoard.setCoordinates('row');
  myBoard.setCoordinates('col');

  myBoard.placeShip(2, 'x', {'x': 1, 'y': 1});
  myBoard.placeShip(5, 'y', {'x': 2, 'y': 3});
  print(myBoard.ships);

  Board enemyBoard = new Board(11);
  enemyBoard.createBoard();
  enemyBoard.setCoordinates('row');
  enemyBoard.setCoordinates('col');

  printBothBoards(myBoard.board, enemyBoard.board);

  // Ship twoDeckShip = new Ship(3, 'y', {'x': 1, 'y': 1});
  // twoDeckShip.fillUpCoordinates();
  // print(twoDeckShip.coordinatesOnBoard);
}

void printBothBoards(List<List<int>> myBoard, List<List<int>> enemyBoard) {
  void printBoard(List<List<int>> board) {
    board.forEach((row) {
      print(row.join(' '));
    });
  }

  print('my board');
  printBoard(myBoard);
  print('\n');
  print('enemys board');
  printBoard(enemyBoard);
}
