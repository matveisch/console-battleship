import 'package:test/test.dart';
import 'lib/RandomAI.dart';
import 'lib/Board.dart';

void main() {
  test('coordinates fit into the board', () {
    expect(RandomAI.checkBoardOverlap(5, 'x', {'x': 1, 'y': 1}), equals(true));
  });

  test('coordinates do not fit into the board', () {
    expect(RandomAI.checkBoardOverlap(3, 'x', {'x': 9, 'y': 1}), equals(false));
  });

  test('coordinates do not fit into the board', () {
    Board board = new Board(11);
    board.createBoard();
    board.setCoordinates('row');
    board.setCoordinates('col');

    board.placeShip(5, 'x', {'x': 1, 'y': 1});

    expect(RandomAI.checkShipOverlay(board.board, 4, 'x', {'x': 1, 'y': 1}), equals(false));
  });
}