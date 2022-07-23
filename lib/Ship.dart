class Ship {
  int size; // values from 2 to 5
  String axis;
  Map coordinates;

  int injuredDecks = 0;
  bool sunken = false;
  // list to store all the coordinates
  List<Map> coordinatesOnBoard = [];

  Ship(this.size, this.axis, this.coordinates);

  void fillUpCoordinates() {
    coordinatesOnBoard.add(coordinates);

    if (axis == 'x' && size > 1) {
      for (int i = 1; i < size; i++) {
        coordinatesOnBoard
            .add({'x': coordinates['x'] + i, 'y': coordinates['y']});
      }
    } else if (axis == 'y' && size > 1) {
      for (int i = 1; i < size; i++) {
        coordinatesOnBoard
            .add({'x': coordinates['x'], 'y': coordinates['y'] + i});
      }
    }
  }

  void hitShip() {
    this.injuredDecks += 1;
    isSunken();
  }

  void isSunken() {
    if (injuredDecks == this.size) {
      this.sunken = true;
    }
  }
}
