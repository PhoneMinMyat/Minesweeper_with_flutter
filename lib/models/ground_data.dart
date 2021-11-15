enum Status { select, unselect, flag }

class GroundData {
  int x;
  int y;
  bool hasBomb;
  int aroundBomb;
  Status currentStatus;
  GroundData({
    required this.x,
    required this.y,
    this.hasBomb = false,
    this.aroundBomb = 0,
    this.currentStatus = Status.unselect
  });
  addBomb() {
    hasBomb = true;
  }

  addAroundBomb() {
    aroundBomb += 1;
  }

}
