part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterStartedEvent extends CounterEvent {}

class CounterChangedEvent extends CounterEvent {
  final int count;

  CounterChangedEvent({required this.count});
}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}
