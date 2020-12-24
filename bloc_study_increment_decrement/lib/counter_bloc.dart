import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_study/counter_event.dart';
import 'package:bloc_study/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(counter: state.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: state.counter - 1);
    }
  }

  void onDecrement() {
    add(DecrementEvent());
  }

  void onIncrement() {
    add(IncrementEvent());
  }
}
