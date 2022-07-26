import 'lib/Board.dart';
import 'lib/AI.dart';
import 'dart:io';

void main() {
  // creating 11x11 board, including one row and one column for coordinates
  Board myBoard = new Board(11);
  myBoard.createBoard();
  myBoard.setCoordinates('row');
  myBoard.setCoordinates('col');

  // print('it is time to place your ships. there are 5 of them: 5-deck Carrier, 4-deck Battleship, 3-deck Cruiser, 3-deck Submarine and 2-deck Destroyer');
  // placeUsersShip('5-deck Carrier', myBoard, 5);
  // placeUsersShip('4-deck Battleship', myBoard, 4);
  // placeUsersShip('3-deck Cruiser', myBoard, 3);
  // placeUsersShip('3-deck Submarine', myBoard, 3);
  // placeUsersShip('2-deck Destroyer', myBoard, 2);
  // print('now as all of the ships are placed, it is time for you to attack the enemy');

  myBoard.placeShip(5, 'x', {'x': 2, 'y': 1});
  myBoard.placeShip(4, 'y', {'x': 5, 'y': 4});
  myBoard.placeShip(3, 'y', {'x': 8, 'y': 4});
  myBoard.placeShip(3, 'y', {'x': 10, 'y': 4});
  myBoard.placeShip(2, 'x', {'x': 2, 'y': 9});

  Board enemyBoard = new Board(11);
  enemyBoard.createBoard();
  enemyBoard.setCoordinates('row');
  enemyBoard.setCoordinates('col');

  // placing ships on enemy's board manually
  // enemyBoard.placeShip(5, 'x', {'x': 2, 'y': 1});
  // enemyBoard.placeShip(4, 'y', {'x': 5, 'y': 4});
  // enemyBoard.placeShip(3, 'y', {'x': 8, 'y': 4});
  // enemyBoard.placeShip(3, 'y', {'x': 10, 'y': 4});
  // enemyBoard.placeShip(2, 'x', {'x': 2, 'y': 9});
  enemyBoard.placeShip(1, 'x', {'x': 1, 'y': 1});

  AI enemyAI = new AI();

  while(myBoard.gameStatus == 'on' && enemyBoard.gameStatus == 'on') {
    attackEnemysShip(enemyBoard);
    print('enemy attacks...');
    myBoard.recieveAttack(enemyAI.returnCoordinates(enemyBoard.board));
    printBoard(myBoard.board);

    if (myBoard.gameStatus == 'off') {
      print('you lose');
    } else if (enemyBoard.gameStatus == 'off') {
      print('you win');
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

void attackEnemysShip(Board board) {
  print('please, enter x coordinate');
  int xCoord = int.parse(stdin.readLineSync() ?? '');
  print('now type in y coordinate');
  int yCoord = int.parse(stdin.readLineSync() ?? '');

  switch (board.board[xCoord][yCoord]) {
    case 1:
      print('hit');
      break;
    case 0:
      print('miss');
      break;
    case 3:
      print('you hit that spot previously');
      break;
    case 2:
      print('you already hit that ship');
      break;
  }
  
  board.recieveAttack({'x': xCoord, 'y': yCoord});
}