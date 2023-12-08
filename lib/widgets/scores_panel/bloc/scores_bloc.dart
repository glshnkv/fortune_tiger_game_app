import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fortune_tiger_game_app/repository/diamonds_repository.dart';
import 'package:fortune_tiger_game_app/repository/gifts_repository.dart';
import 'package:fortune_tiger_game_app/services/shared_preferences.dart';
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

  void _addDiamondsHandler(AddDiamondsEvent event, Emitter<ScoresState> emit) async {
    emit(UpdatingScoresState());
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    _diamondsRepository.increment(event.diamondsCount);
    storage.diamonds += event.diamondsCount;
    final diamonds = storage.diamonds;
    final gifts = storage.gifts;
    emit(UpdateScoresState(
        giftsCount: gifts,
        diamondsCount: diamonds));
  }

  void _addGiftsHandler(AddGiftsEvent event, Emitter<ScoresState> emit) async {
    emit(UpdatingScoresState());
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    _giftsRepository.increment(event.giftsCount);
    storage.diamonds += event.giftsCount;
    final diamonds = storage.diamonds;
    final gifts = storage.gifts;
    emit(UpdateScoresState(
        giftsCount: gifts,
        diamondsCount: diamonds));
  }

  void _payForSpinHandler(PayForSpinEvent event, Emitter<ScoresState> emit) async {
    emit(UpdatingScoresState());
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    _diamondsRepository.decrement(40);
    storage.diamonds -= 40;
    final diamonds = storage.diamonds;
    final gifts = storage.gifts;
    emit(UpdateScoresState(
        giftsCount: gifts,
        diamondsCount: diamonds));
  }

  void _updateScoresHandler(UpdateScoresEvent event, Emitter<ScoresState> emit) async {
    emit(UpdatingScoresState());
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    final diamonds = storage.diamonds;
    final gifts = storage.gifts;
    emit(UpdateScoresState(
        giftsCount: gifts,
        diamondsCount: diamonds));
  }

  _initialize() async {
    emit(UpdatingScoresState());
    emit(UpdateScoresState(
        giftsCount: _giftsRepository.getGiftsCount,
        diamondsCount: _diamondsRepository.getDiamondsCount));
  }
}
