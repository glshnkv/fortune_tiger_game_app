part of 'daily_bonus_bloc.dart';

@immutable
abstract class DailyBonusState {}

class DailyBonusInitial extends DailyBonusState {}

class FailureGetBonusState extends DailyBonusState {}
