import 'package:flutter/material.dart';
import 'package:minesweeper/models/ground_data.dart';
import 'widgets/ground.dart';
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
    board = getBoard(boardWidth, boardLength, numberOfBombs);

    super.initState();
  }

  void setFlag(int index) {
    setState(() {
      if (board[index].currentStatus == Status.unselect) {
        board[index].currentStatus = Status.flag;
      } else if (board[index].currentStatus == Status.flag) {
        board[index].currentStatus = Status.unselect;
      }
    });
  }

  void selectGround(int index) {
    setState(() {
      board[index].currentStatus = Status.select;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minesweeper'),
      ),
      body: Center(
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: board.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: boardWidth),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black)),
                child: Ground(
                  groundInfo: board[index],
                  selectGround: selectGround,
                  setFlag: setFlag,
                  index: index,
                ),
              );
            }),
      ),
    );
  }
}
