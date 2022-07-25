import 'dart:math';

class AI {
  bool lastHitSuccessful = false;
  List usedCoordinates = [];
  List targets = [];

  // to generate random nums
  Random random = new Random();
  int randomNum(int min, int max) => min + random.nextInt(max - min);

  // if lastHitSuccessful && attempts.length > 0
  Map<String, int> returnCoordinates() {
    Map<String, int> coordinates = {};

    // if it is first attack
    if (!lastHitSuccessful && usedCoordinates.isEmpty) {
      coordinates = {'x': randomNum(1, 10), 'y': randomNum(1, 10)};
      usedCoordinates.add(coordinates);
    // if last hit successful and there are no saved targets
    } else if (lastHitSuccessful && targets.isEmpty) {
      // add several coordinates based on last coordinates
      targets.add({'x': usedCoordinates.last['x'] + 1, 'y': usedCoordinates.last['y']});
      targets.add({'x': usedCoordinates.last['x'], 'y': usedCoordinates.last['y'] + 1});
      targets.add({'x': usedCoordinates.last['x'] - 1, 'y': usedCoordinates.last['y']});
      targets.add({'x': usedCoordinates.last['x'], 'y': usedCoordinates.last['y'] - 1});
    }

    return coordinates;
  }
}