class GroundData {
  int x;
  int y;
  bool hasBomb;
  int aroundBomb;
  GroundData(
      {required this.x,
      required this.y,
      this.hasBomb = false,
      this.aroundBomb = 0});
}
