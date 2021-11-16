import 'package:flutter/material.dart';
import 'package:minesweeper/models/ground_data.dart';
import 'package:minesweeper/widgets/board.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'controllers/bomb_logic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int boardWidth = 10;
  int boardLength = 10;
  int numberOfBombs = 25;

  List<GroundData> board = [];

  @override
  void initState() {
    newGame();

    super.initState();
  }

  void newGame() {
    setState(() {
      board = getBoard(boardWidth, boardLength, numberOfBombs);
    });
  }

  void loseGame() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('You Lose'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('DO YOU KNOW?'),
                  const Icon(MdiIcons.bombOff),
                  const Text(
                      'UNICEF has reported a total of 72 incidents across Myanmar in the first four months of 2021.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        newGame();
                      },
                      child: const Text('New Game'))
                ],
              ),
            ),
          );
        });
  }

  void winGame() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('You WINNNNN!'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('You WINN The Game'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        newGame();
                      },
                      child: const Text('New Game'))
                ],
              ),
            ),
          );
        });
  }

  void setFlag(int index) {
    setState(() {
      board[index].setFlag();
    });
  }

  void selectGround(int index) {
    setState(() {
      if (board[index].currentStatus == Status.unselect) {
        board[index].selectGround();

        if (board[index].aroundBomb == 0 && board[index].hasBomb == false) {
          clickClearGround(
            board,
            index,
          );
        }
        if (board[index].hasBomb == true) {
          loseGame();
        }

        int tempIndex = board.indexWhere((element) =>
          element.hasBomb == false && element.currentStatus == Status.unselect
        );
        if (tempIndex < 0) {
          winGame();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minesweeper'),
      ),
      body: Center(
        child: Column(children: [
          Board(
              board: board,
              boardWidth: boardWidth,
              selectGround: selectGround,
              setFlag: setFlag),
          ElevatedButton(
              onPressed: () => newGame(), child: const Text('New Game'))
        ]),
      ),
    );
  }
}
