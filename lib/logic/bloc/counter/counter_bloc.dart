import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dart_frog_web_socket/data/repository/counter_repo.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final counterRepo = CounterRepository();

  CounterBloc() : super(CounterInitial()) {
    on<CounterStartedEvent>(_counterStart);
    on<CounterIncrementEvent>(_increment);
    on<CounterDecrementEvent>(_decrement);
    on<CounterChangedEvent>(_counterChange);
  }

  _counterStart(CounterStartedEvent event, Emitter<CounterState> emit) {
    counterRepo.getMessage.listen((count) {
      add(CounterChangedEvent(count: int.parse(count)));
      print(count);
    });
  }

  _counterChange(CounterChangedEvent event, Emitter<CounterState> emit) {
    emit(CountingState(counter: event.count));
  }

  _increment(CounterIncrementEvent event, Emitter<CounterState> emit) {
    counterRepo.increment();
  }

  _decrement(CounterDecrementEvent event, Emitter<CounterState> emit) {
    counterRepo.decrement();
  }
}
