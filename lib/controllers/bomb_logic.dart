
import 'package:minesweeper/models/ground_data.dart';

List<GroundData> getBoard(int boardWidth, int boardLength, int numberOfBombs) {
  List<GroundData> board = [];

//add board cells' x and y locations
  for (int y = 0; y < boardLength; y++) {
    for (int x = 0; x < boardWidth; x++) {
      board.add(GroundData(x: x, y: y));
    }
  }

//add Bomb to board cells
  //get random number for bomb location
  List bombIndex = List.generate(board.length, (i) => i);
  bombIndex.shuffle();
  int tempIndex ;

  //first (numberOfBombs) number of list should be the place bomb
  for (int x = 0; x < numberOfBombs; x++) {
    int bombLocation = bombIndex[x];

    //add bomb
    board[bombLocation].addBomb();

    //calculate around Bomb
    int bombX = board[bombLocation].x;
    int bombY = board[bombLocation].y;

    //top left ground
    tempIndex = board.indexWhere(
        (element) => element.x == bombX - 1 && element.y == bombY - 1);
    if (tempIndex >= 0) {
      board[tempIndex].addAroundBomb();
    }

    //top centre ground
    tempIndex = board
        .indexWhere((element) => element.x == bombX && element.y == bombY - 1);
    if (tempIndex >= 0) {
      board[tempIndex].addAroundBomb();
    }

    //top right ground
    tempIndex = board.indexWhere(
        (element) => element.x == bombX + 1 && element.y == bombY - 1);
    if (tempIndex >= 0) {
      board[tempIndex].addAroundBomb();
    }

    //right ground
    tempIndex = board
        .indexWhere((element) => element.x == bombX + 1 && element.y == bombY);
    if (tempIndex >= 0) {
      board[tempIndex].addAroundBomb();
    }

    // left ground
    tempIndex = board
        .indexWhere((element) => element.x == bombX - 1 && element.y == bombY);
    if (tempIndex >= 0) {
      board[tempIndex].addAroundBomb();
    }

    //bottom left ground
    tempIndex = board.indexWhere(
        (element) => element.x == bombX - 1 && element.y == bombY + 1);
    if (tempIndex >= 0) {
      board[tempIndex].addAroundBomb();
    }

    //bottom centre ground
    tempIndex = board
        .indexWhere((element) => element.x == bombX && element.y == bombY + 1);
    if (tempIndex >= 0) {
      board[tempIndex].addAroundBomb();
    }

    //bottom right ground
    tempIndex = board.indexWhere(
        (element) => element.x == bombX + 1 && element.y == bombY + 1);
    if (tempIndex >= 0) {
      board[tempIndex].addAroundBomb();
    }
  }

  return board;
}
