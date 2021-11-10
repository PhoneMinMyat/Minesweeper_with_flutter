import 'package:flutter/material.dart';
import 'package:minesweeper/models/ground_data.dart';
import 'widgets/ground.dart';

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
  int numberOfBombs = 30;

  List<GroundData> board = [];

//add board cells' x and y locations
  void addBoardLocation() {
    for (int y = 0; y < boardWidth; y++) {
      for (int x = 0; x < boardLength; x++) {
        board.add(GroundData(x: x, y: y));
      }
    }
  }

//add Bomb to board cells
  void addBomb() {
    List bombIndex = List.generate(board.length, (i) => i);
    bombIndex.shuffle();
    for (int x = 0; x < numberOfBombs; x++) {
      int bombLocation = bombIndex[x];
      GroundData tempBoard = board[bombLocation];

      board[bombLocation] =
          GroundData(x: tempBoard.x, y: tempBoard.y, hasBomb: true);
    }
  }

  @override
  void initState() {
    addBoardLocation();
    addBomb();
    super.initState();
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
                child: Ground(groundInfo: board[index]),
              );
            }),
      ),
    );
  }
}
