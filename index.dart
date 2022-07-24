import 'lib/Board.dart';
import 'dart:io';

void main() {
  // creating 11x11 board, including one row and one column for coordinates
  Board myBoard = new Board(11);
  myBoard.createBoard();
  myBoard.setCoordinates('row');
  myBoard.setCoordinates('col');

  // print('it is time to place your ships. there are 5 of them: 5-deck Carrier, 4-deck Battleship, 3-deck Cruiser, 3-deck Submarine and 2-deck Destroyer');
  placeUsersShip('5-deck Carrier', myBoard, 5);
  placeUsersShip('4-deck Battleship', myBoard, 4);
  // placeUsersShip('3-deck Cruiser', myBoard, 3);
  // placeUsersShip('3-deck Submarine', myBoard, 3);
  // placeUsersShip('2-deck Destroyer', myBoard, 2);


  // myBoard.placeShip(5, 'x', {'x': 1, 'y': 1});
  // myBoard.placeShip(4, 'y', {'x': 5, 'y': 4});
  // myBoard.placeShip(3, 'y', {'x': 8, 'y': 4});

  // Board enemyBoard = new Board(11);
  // enemyBoard.createBoard();
  // enemyBoard.setCoordinates('row');
  // enemyBoard.setCoordinates('col');

  // printBoard(myBoard.board);
  // printBothBoards(myBoard.board, enemyBoard.board);
}

void printBoard(List<List<int>> board) {
    board.forEach((row) {
      print(row.join(' '));
    });
  }

void printBothBoards(List<List<int>> myBoard, List<List<int>> enemyBoard) {
  print('my board');
  printBoard(myBoard);
  print('\n');
  print('enemys board');
  printBoard(enemyBoard);
}

// asking iser for coordinates and axis to place ships on his board
void placeUsersShip(String shipName, Board board, int size) {
  print('please, enter axis for $shipName (either x or y)');
  String? shipAxis = stdin.readLineSync();
  print('now type in starting x coordinate');
  int xCoord = int.parse(stdin.readLineSync() ?? '');
  print('now type in starting y coordinate');
  int yCoord = int.parse(stdin.readLineSync() ?? '');

  // if there are any ships on the board
  if (board.ships.isNotEmpty) {
    bool isOccupied = false;

    // filtering ships with exact axis
    board.ships.where((ship) => ship.axis == shipAxis).forEach((ship) {
      // looping through coordinates
      ship.coordinatesOnBoard.forEach((element) {
        // comparing each coordinate with user input
        if (element['x'] == xCoord && element['y'] == yCoord) {
          isOccupied = true;
        }
      });
    });

    if (isOccupied) {
      print('sorry, you cannot place ships on each other. choose different coordinates');
      placeUsersShip(shipName, board, size);
    } else {
      board.placeShip(size, shipAxis, {'x': xCoord, 'y': yCoord});
      printBoard(board.board);
    }
  } else {
    board.placeShip(size, shipAxis, {'x': xCoord, 'y': yCoord});
    printBoard(board.board);
  }
}
