
class DiamondsRepository {
  int _diamondsCounter = 0;

  int get getDiamondsCount => _diamondsCounter;

  void increment(int score) => _diamondsCounter += score;
}