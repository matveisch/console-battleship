import 'Ship.dart';

class Board {
  int size;
  List<List<int>> board = [];

  // array to store all placed ships
  List<Ship> ships = [];

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

  void placeShip(int size, String axis, Map coordinates) {
    // create new ship
    Ship ship = new Ship(size, axis, coordinates);
    ship.fillUpCoordinates();

    // add new ship to array of all ships to be placed
    ships.add(ship);


    if (axis == 'x') {
      // check if the ship wont overlay the board
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
}