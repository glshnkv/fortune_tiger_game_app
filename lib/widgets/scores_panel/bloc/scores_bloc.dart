import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fortune_tiger_game_app/repository/diamonds_repository.dart';
import 'package:fortune_tiger_game_app/repository/gifts_repository.dart';
import 'package:meta/meta.dart';

part 'scores_event.dart';

part 'scores_state.dart';

class ScoresBloc extends Bloc<ScoresEvent, ScoresState> {
  final DiamondsRepository _diamondsRepository;
  final GiftsRepository _giftsRepository;

  ScoresBloc(this._diamondsRepository, this._giftsRepository)
      : super(ScoresInitial()) {
    on<AddDiamondsEvent>(_addDiamondsHandler);
    on<AddGiftsEvent>(_addGiftsHandler);

    _initialize();
  }

  void _addDiamondsHandler(AddDiamondsEvent event, Emitter<ScoresState> emit) {
    _diamondsRepository.increment(event.diamondsCount);
    emit(UpdateScoresState(
        giftsCount: _giftsRepository.getGiftsCount,
        diamondsCount: _diamondsRepository.getDiamondsCount));
  }

  void _addGiftsHandler(AddGiftsEvent event, Emitter<ScoresState> emit) {
    _giftsRepository.increment(event.giftsCount);
    emit(UpdateScoresState(
        giftsCount: _giftsRepository.getGiftsCount,
        diamondsCount: _diamondsRepository.getDiamondsCount));
  }

  _initialize() async {
    emit(UpdateScoresState(
        giftsCount: _giftsRepository.getGiftsCount,
        diamondsCount: _diamondsRepository.getDiamondsCount));
  }
}
