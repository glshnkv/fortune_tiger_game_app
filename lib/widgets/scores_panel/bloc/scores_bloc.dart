import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fortune_tiger_game_app/repository/diamonds_repository.dart';
import 'package:fortune_tiger_game_app/repository/gifts_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'scores_event.dart';

part 'scores_state.dart';

class ScoresBloc extends Bloc<ScoresEvent, ScoresState> {
  final DiamondsRepository _diamondsRepository;
  final GiftsRepository _giftsRepository;
  final Future<SharedPreferences> _prefs;

  ScoresBloc(this._diamondsRepository, this._giftsRepository, this._prefs)
      : super(ScoresInitial()) {
    on<AddDiamondsEvent>(_addDiamondsHandler);
    on<AddGiftsEvent>(_addGiftsHandler);
    on<PayForSpinEvent>(_payForSpinHandler);
    on<UpdateScoresEvent>(_updateScoresHandler);
    // on<CheckDiamondsCounterEvent>(_checkDiamondsCounterEventHandler);

    _initialize();

  }

  void _addDiamondsHandler(AddDiamondsEvent event, Emitter<ScoresState> emit) {
    emit(UpdatingScoresState());
    _diamondsRepository.increment(event.diamondsCount);
    emit(UpdateScoresState(
        giftsCount: _giftsRepository.getGiftsCount,
        diamondsCount: _diamondsRepository.getDiamondsCount));
  }

  void _addGiftsHandler(AddGiftsEvent event, Emitter<ScoresState> emit)  {
    emit(UpdatingScoresState());
    _giftsRepository.increment(event.giftsCount);
    emit(UpdateScoresState(
        giftsCount: _giftsRepository.getGiftsCount,
        diamondsCount: _diamondsRepository.getDiamondsCount));
  }

  void _payForSpinHandler(PayForSpinEvent event, Emitter<ScoresState> emit)  {
    emit(UpdatingScoresState());
    _diamondsRepository.decrement(40);
    emit(UpdateScoresState(
        giftsCount: _giftsRepository.getGiftsCount,
        diamondsCount: _diamondsRepository.getDiamondsCount));
  }

  void _updateScoresHandler(UpdateScoresEvent event, Emitter<ScoresState> emit)  {
    emit(UpdatingScoresState());
    final diamonds = _diamondsRepository.getDiamondsCount;
    final gifts = _giftsRepository.getGiftsCount;
    emit(UpdateScoresState(
        giftsCount: gifts,
        diamondsCount: diamonds));
  }

  // void _checkDiamondsCounterEventHandler(CheckDiamondsCounterEvent event, Emitter<ScoresState> emit) {
  //   if (_diamondsRepository.getDiamondsCount >= 40) {
  //     emit(NotEnoughDiamondsState());
  //   } else {
  //     emit(SuccesCheckCounterState());
  //   }
  // }

  _initialize() async {
    emit(UpdatingScoresState());
    emit(UpdateScoresState(
        giftsCount: _giftsRepository.getGiftsCount,
        diamondsCount: _diamondsRepository.getDiamondsCount));
  }
}
