import 'dart:async';

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
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.dark().copyWith(
              primary: const Color(0x50000000),
              secondary: const Color(0xff336699),
              background: const Color(0xff86bbd8),
              onBackground: const Color(0xfff0f0c9),
              onPrimary: const Color(0xfff7dad9))),
      home: const HomePage(),
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
  bool firstClick = true;

  List<GroundData> board = [];

  Duration duration = const Duration();
  Timer? timer;

  bool isGameOver = false;

  @override
  void initState() {
    newGame();
    stopTimer();
    super.initState();
  }

  void newGame() {
    setState(() {
      resetTimer();
      board = getBoard(boardWidth, boardLength, numberOfBombs);
      firstClick = true;
    });
  }

  void loseGame() {
    stopTimer();
    for (int x = 0; x < board.length; x++) {
      board[x].currentStatus = Status.select;
    }
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
                  const Text('You WIN The Game'),
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
    if (firstClick) {
      startTimer();
      firstClick = false;
    }

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

        int checkAllClearGroundIsSelect = board.indexWhere((element) =>
            element.hasBomb == false &&
            element.currentStatus == Status.unselect);

        int checkAllBombIsNotSelect = board.indexWhere((element) =>
            element.hasBomb == true && element.currentStatus == Status.select);
        if (checkAllClearGroundIsSelect < 0 && checkAllBombIsNotSelect < 0) {
          winGame();
        }
      }
    });
  }

  void addTime() {
    setState(() {
      final seconds = duration.inSeconds + 1;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void resetTimer() {
    setState(() {
      stopTimer();
      duration = const Duration();
      firstClick = true;
    });
  }

  void stopTimer() {
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minesweeper'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mines: $numberOfBombs'),
              Text('$minutes:$seconds')
            ],
          ),
          Board(
              board: board,
              boardWidth: boardWidth,
              selectGround: selectGround,
              setFlag: setFlag),
          ElevatedButton(
            onPressed: () => newGame(),
            child: const Text('New Game'),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.secondary),
          )
        ]),
      ),
    );
  }
}
