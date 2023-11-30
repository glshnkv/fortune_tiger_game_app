
class GiftsRepository {
  int _giftsCounter = 0;

  int get getGiftsCount => _giftsCounter;

  void increment(int gifts) => _giftsCounter += gifts;
}