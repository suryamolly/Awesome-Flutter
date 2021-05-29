import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_bloc_poc/logic/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    test(
        "Test for the initial value of the counter cubit with the countervalue:0",
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
      'The Cubit should emit CounterState(counterValue:1 and isIncremented:true) when cubit.increment() methiod is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, isIncremented: true)],
    );

    blocTest(
      'The Cubit should emit CounterState(counterValue:-1 and isIncremented:false) when cubit.decrement() methiod is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, isIncremented: false)],
    );
  });
}
