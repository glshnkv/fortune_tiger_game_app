part of 'scores_bloc.dart';

@immutable
abstract class ScoresState {

}

class ScoresInitial extends ScoresState {}

class NotEnoughDiamondsState extends ScoresState {}


class UpdateScoresState extends ScoresState {
  final int diamondsCount;
  final int giftsCount;

  UpdateScoresState({required this.diamondsCount, required this.giftsCount});
}

class UpdatingScoresState extends ScoresState {}

class SuccesCheckCounterState extends ScoresState {}

