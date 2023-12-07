import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fortune_tiger_game_app/repository/diamonds_repository.dart';
import 'package:fortune_tiger_game_app/repository/gifts_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'daily_bonus_event.dart';
part 'daily_bonus_state.dart';

class DailyBonusBloc extends Bloc<DailyBonusEvent, DailyBonusState> {
  final DiamondsRepository _diamondsRepository;
  final Future<SharedPreferences> _prefs;

  DailyBonusBloc(this._diamondsRepository, this._prefs) : super(DailyBonusInitial()) {
    on<GetDailyBonusEvent>(_getDailyBonusHandler);

  }

  void _getDailyBonusHandler(GetDailyBonusEvent event, Emitter<DailyBonusState> emit) async {
    final SharedPreferences prefs = await _prefs;
    final int lastBonusTime = prefs.getInt('lastBonusTime') ?? 0;
    final int currentTime = DateTime.now().millisecondsSinceEpoch;
    final int twentyFourHours = 24 * 60 * 60 * 1000;

    if (currentTime - lastBonusTime >= twentyFourHours) {
      _diamondsRepository.increment(1000);
      prefs.setInt('lastBonusTime', currentTime);
    } else {
      emit(FailureGetBonusState());
    }
  }
}
