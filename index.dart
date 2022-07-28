import 'lib/Board.dart';
import 'lib/AI.dart';
import 'dart:io';

void main() {
  // creating 11x11 board, including one row and one column for coordinates
  Board myBoard = new Board(11);
  myBoard.createBoard();
  myBoard.setCoordinates('row');
  myBoard.setCoordinates('col');

  print('it is time to place your ships. there are 5 of them: 5-deck Carrier, 4-deck Battleship, 3-deck Cruiser, 3-deck Submarine and 2-deck Destroyer');
  placeUsersShip('5-deck Carrier', myBoard, 5);
  placeUsersShip('4-deck Battleship', myBoard, 4);
  placeUsersShip('3-deck Cruiser', myBoard, 3);
  placeUsersShip('3-deck Submarine', myBoard, 3);
  placeUsersShip('2-deck Destroyer', myBoard, 2);
  print('now as all of the ships are placed, it is time for you to attack the enemy');

  Board enemyBoard = new Board(11);
  enemyBoard.createBoard();
  enemyBoard.setCoordinates('row');
  enemyBoard.setCoordinates('col');

  AI enemyAI = new AI();

  while(myBoard.gameStatus == 'on' && enemyBoard.gameStatus == 'on') {
    attackEnemysShip(enemyBoard);
    print('enemy attacks...');
    myBoard.recieveAttack(enemyAI.returnCoordinates(myBoard.board));

    if (myBoard.gameStatus == 'off') {
      print('you lose');
    } else if (enemyBoard.gameStatus == 'off') {
      print('you win');
    } else {
      printBoard(myBoard.board);
    }
  }
}

void printBoard(List<List<int>> board) {
    board.forEach((row) {
      print(row.join(' '));
    });
  }

// asking iser for coordinates and axis to place ships on his board
void placeUsersShip(String shipName, Board board, int size) {
  print('please, enter axis for $shipName (either x or y)');
  String? shipAxis = stdin.readLineSync();

  while (shipAxis != 'x' && shipAxis != 'y') {
    print('only x or y symbols are valid. try arain');
    shipAxis = stdin.readLineSync();
  }

  print('now type in starting x coordinate');
  int xCoord = int.parse(stdin.readLineSync() ?? '');

  while (xCoord > 10 || xCoord < 1) {
    print('x coordinate can only be in range of 1 to 10. try again');
    xCoord = int.parse(stdin.readLineSync() ?? '');
  }

  print('now type in starting y coordinate');
  int yCoord = int.parse(stdin.readLineSync() ?? '');

  while (yCoord > 10 || yCoord < 1) {
    print('y coordinate can only be in range of 1 to 10. try again');
    yCoord = int.parse(stdin.readLineSync() ?? '');
  }

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

void attackEnemysShip(Board board) {
  print('please, enter x coordinate');
  int xCoord = int.parse(stdin.readLineSync() ?? '');

  while (xCoord > 10 || xCoord < 1) {
    print('x coordinate can only be in range of 1 to 10. try again');
    xCoord = int.parse(stdin.readLineSync() ?? '');
  }

  print('now type in y coordinate');
  int yCoord = int.parse(stdin.readLineSync() ?? '');

  while (yCoord > 10 || yCoord < 1) {
    print('y coordinate can only be in range of 1 to 10. try again');
    yCoord = int.parse(stdin.readLineSync() ?? '');
  }

  switch (board.board[xCoord][yCoord]) {
    case 1:
      print('hit');
      break;
    case 0:
      print('miss');
      break;
    case 3:
      print('you tried that spot previously. no ship here. try again');
      attackEnemysShip(board);
      break;
    case 2:
      print('you already hit that ship. choose another set of coordinates');
      attackEnemysShip(board);
      break;
  }
  
  board.recieveAttack({'x': xCoord, 'y': yCoord});
}