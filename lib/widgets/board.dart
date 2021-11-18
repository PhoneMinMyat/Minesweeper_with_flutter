import 'package:flutter/material.dart';
import 'package:minesweeper/models/ground_data.dart';
import 'package:minesweeper/widgets/ground.dart';

class Board extends StatelessWidget {
  final List<GroundData> board;
  final int boardWidth;
  final Function selectGround;
  final Function setFlag;
  const Board(
      {required this.board,
      required this.boardWidth,
      required this.selectGround,
      required this.setFlag,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: board.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: boardWidth),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border.all(color: Colors.black)),
            child: Ground(
              groundInfo: board[index],
              selectGround: selectGround,
              setFlag: setFlag,
              index: index,
            ),
          );
        });
  }
}
