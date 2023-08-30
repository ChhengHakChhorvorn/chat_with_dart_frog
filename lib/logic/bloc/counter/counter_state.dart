part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CountingState extends CounterState {
  final int counter;

  CountingState({
    required this.counter,
  });
}
