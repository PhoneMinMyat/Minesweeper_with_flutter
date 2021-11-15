//This widget is used for the table
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:minesweeper/models/ground_data.dart';

class Ground extends StatefulWidget {
  final GroundData groundInfo;
  final Function setFlag;
  final Function selectGround;
  final int index;

  const Ground(
      {required this.groundInfo,
      required this.selectGround,
      required this.setFlag,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  Widget getGroundWidget() {
    if (widget.groundInfo.currentStatus == Status.select) {
      if (widget.groundInfo.hasBomb == true) {
        return const Icon(MdiIcons.bomb);
      } else {
        if (widget.groundInfo.aroundBomb == 0) {
          return const Text('');
        } else {
          return Text(widget.groundInfo.aroundBomb.toString());
        }
      }
    } else if (widget.groundInfo.currentStatus == Status.unselect) {
      return Container(
        color: Colors.brown,
      );
    } else {
      return const Icon(MdiIcons.flag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.selectGround(widget.index);
      },
      onLongPress: () {
        widget.setFlag(widget.index);
      },
      child: Center(
        child: getGroundWidget(),
      ),
    );
  }
}

// x:${widget.groundInfo.x} \n y:${widget.groundInfo.y} \n 

