import 'dart:math';

class AI {
  bool lastHitSuccessful = false;
  List usedCoordinates = [];
  List targets = [];

  // to generate random nums
  Random random = new Random();
  int randomNum(int min, int max) => min + random.nextInt(max - min);

  // if lastHitSuccessful && attempts.length > 0
  Map returnCoordinates(List<List<int>> board) {
    Map coordinates = {};

    // if last attack fails and there are no presaved targets
    if (lastHitSuccessful == false && targets.isEmpty) {
      coordinates = {'x': randomNum(1, 10), 'y': randomNum(1, 10)};
      usedCoordinates.add(coordinates);
    }
    
    // if last hit successful and there are no presaved targets
    if (lastHitSuccessful == true && targets.isEmpty) {
      // add several coordinates based on last coordinates
      targets.add({'x': usedCoordinates.last['x'] + 1, 'y': usedCoordinates.last['y']});
      targets.add({'x': usedCoordinates.last['x'], 'y': usedCoordinates.last['y'] + 1});
      targets.add({'x': usedCoordinates.last['x'] - 1, 'y': usedCoordinates.last['y']});
      targets.add({'x': usedCoordinates.last['x'], 'y': usedCoordinates.last['y'] - 1});
    } 
    
    // if there are presaved targets
    if (targets.isNotEmpty) {
      coordinates = targets.first;
      targets.remove(targets.first);
    }

    if (board[coordinates['y']][coordinates['x']] == 1) {
      lastHitSuccessful = true;
    } else {
      lastHitSuccessful = false;
    }

    // работает. нужно продумать, что делать, когда один из координат из targets подходит – нужно бить по траектории

    print(targets);
    print(coordinates);
    print(lastHitSuccessful);
    print(board[coordinates['y']][coordinates['x']]);

    return coordinates;
  }
}