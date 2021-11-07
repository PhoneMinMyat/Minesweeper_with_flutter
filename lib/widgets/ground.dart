//This widget is used for the table
import 'package:flutter/material.dart';

enum Status { select, unselect, flag, mine }

class Ground extends StatefulWidget {
  const Ground({Key? key}) : super(key: key);

  @override
  _GroundState createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  Status currentState = Status.unselect;
  String showText() {
    if (currentState == Status.unselect) {
      return " ";
    } else if (currentState == Status.select) {
      return "S";
    } else if (currentState == Status.flag) {
      return "F";
    } else if (currentState == Status.mine) {
      return "M";
    } else {
      return "E";
    }
  }

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
        child: Text(showText()),
      ),
    );
  }
}
