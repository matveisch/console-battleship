import 'Ship.dart';

class Board {
  int size;
  List<List<int>> board = [];

  // array to store all placed ships
  List<Ship> ships = [];
  // variable to track state of the game
  String gameStatus = 'on';

  Board(this.size);

  void createBoard() {
    board = new List.generate(size, (index) => new List.generate(size, (index) => 0));
  }

  // function that sets coordinates (either for the rows or columns)
  void setCoordinates(String type) {
    for (int i = 0; i < size; i++) {
      board[type == 'row' ? 0 : i][type == 'row' ? i : 0] = i;
    }
  }

  void placeShip(int size, String? axis, Map coordinates) {
    // create new ship
    Ship ship = new Ship(size, axis, coordinates);
    ship.fillUpCoordinates();

    // add new ship to array of all ships to be placed
    ships.add(ship);

    // ignore: todo
    // TODO error handling when coordinate is bigger than board size
    if (axis == 'x') {
      // check if the ship overlays the board
      if (coordinates['x'] < 12 - size) {
        for (int i = coordinates['x'], j = 0; j < size; i++, j++) {
          board[coordinates['y']][i] = 1;
        }
      } else {
        print('error');
      }
		} else if (axis == 'y') {
      if (coordinates['y'] < 12 - size) {
        for (int i = coordinates['y'], j = 0; j < size; i++, j++) {
          board[i][coordinates['x']] = 1;
        }
      } else {
        print('error');
      }
		}
  }

  void checkGameStatus() {
    gameStatus = 'off';

    for (int i = 0; i < ships.length; i++) {
			if (ships[i].sunken == false) {
				gameStatus = 'on';
				break;
			}
		}
  }

  void recieveAttack(Map coordinates) {
    if (board[coordinates['y']][coordinates['x']] == 1) {
			board[coordinates['y']][coordinates['x']] = 2;
			for (int i = 0; i < ships.length; i++) {
				for (int j = 0; j < ships[i].coordinatesOnBoard.length; j++) {
					if ((ships[i].coordinatesOnBoard[j]['y'] == coordinates['y']) && (ships[i].coordinatesOnBoard[j]['x'] == coordinates['x'])) {
						ships[i].hitShip();
						break;
					}
				}
			}
			checkGameStatus();
		} else if (board[coordinates['y']][coordinates['x']] == 0) {
			board[coordinates['y']][coordinates['x']] = 3;
		}
  }
}