part of 'scores_bloc.dart';

@immutable
abstract class ScoresEvent {}

class AddDiamondsEvent extends ScoresEvent {
  final int diamondsCount;

  AddDiamondsEvent({required this.diamondsCount});
}

class AddGiftsEvent extends ScoresEvent {
  final int giftsCount;

  AddGiftsEvent({required this.giftsCount});
}

class PayForSpinEvent extends ScoresEvent {
}

class UpdateScoresEvent extends ScoresEvent {
}

class CheckDiamondsCounterEvent extends ScoresEvent {
}
