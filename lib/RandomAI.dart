import 'dart:math';

class RandomAI {
  String randomAxis = '';
  Map randomCoordinates = {};

  List previouslyUsedCoordinates = [];

  // to generate random nums
  Random random = new Random();
  int randomNum(int min, int max) => min + random.nextInt(max - min);

  void generateRandomAxis() {
    int number = randomNum(0, 2);

    if (number == 0) {
      randomAxis = 'x';
    } else if (number == 1) {
      randomAxis = 'y';
    }
  }

  void generateRandomCoordinates(int size, List<List<int>> board) {
    randomCoordinates = {'x': randomNum(1, 10), 'y': randomNum(1, 10)};

    while (checkBoardOverlap(size, randomAxis, randomCoordinates) != true) {
      randomCoordinates = {'x': randomNum(1, 10), 'y': randomNum(1, 10)};
    }

    if (checkShipOverlay(board, size, randomAxis, randomCoordinates) && checkBoardOverlap(size, randomAxis, randomCoordinates)) {
      // check if random coordinates are the new ones
      if (previouslyUsedCoordinates.isNotEmpty) {
        previouslyUsedCoordinates.forEach((element) {
          if (element == randomCoordinates) {
            generateRandomCoordinates(size, board);
          }
        });
      }

      previouslyUsedCoordinates.add(randomCoordinates);
    } else {
      generateRandomCoordinates(size, board);
    }
  }

  static bool checkBoardOverlap(int size, String axis, Map coordinates) {
    bool valid = false;

    if (axis == 'x') {
      // check if the ship overlays the board
      if (coordinates['x'] < 12 - size) {
        valid = true;
      }
    } else if (axis == 'y') {
      if (coordinates['y'] < 12 - size) {
        valid = true;
      }
    }

    return valid;
  }

  static bool checkShipOverlay(List<List<int>> board, int size, String axis, Map coordinates) {
    bool valid = true;
    
    if (axis == 'x') {
      for (int i = coordinates['x'], j = 0; j < size; i++, j++) {
        if (board[coordinates['y']][i] == 1) {
          valid = false;
          break;
        }
      }
    } else if (axis == 'y') {
      for (int i = coordinates['y'], j = 0; j < size; i++, j++) {
        if (board[i][coordinates['x']] == 1) {
          valid = false;
          break;
        }
      }
    }

    return valid;
  }
}