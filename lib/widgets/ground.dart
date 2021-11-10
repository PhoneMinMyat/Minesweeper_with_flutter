//This widget is used for the table
import 'package:flutter/material.dart';
import 'package:minesweeper/models/ground_data.dart';

enum Status { select, unselect, flag, mine }

class Ground extends StatefulWidget {
  final GroundData groundInfo;
  const Ground({required this.groundInfo, Key? key}) : super(key: key);

  @override
  _GroundState createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  Status currentState = Status.unselect;

  // Widget getBoardWidget(){
    
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          currentState = Status.select;
        });
      },
      onLongPress: () {
        setState(() {
          if (currentState != Status.select) {
            currentState = Status.flag;
          }
        });
      },
      child: Center(
        child: Text(
            'bomb:${widget.groundInfo.hasBomb}'),
      ),
    );
  }
}

// x:${widget.groundInfo.x} \n y:${widget.groundInfo.y} \n 