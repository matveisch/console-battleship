class Board {
  int size;
  List<List<int>> board = [];

  Board(this.size);

  void createBoard() {
    board = new List.generate(
        size, (index) => new List.generate(size, (index) => 0));
  }

  // function that sets coordinates (either for the rows or columns)
  void setCoordinates(String type) {
    for (int i = 0; i < size; i++) {
      board[type == 'row' ? 0 : i][type == 'row' ? i : 0] = i;
    }
  }

}