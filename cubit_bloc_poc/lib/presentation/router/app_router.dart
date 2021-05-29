import 'package:cubit_bloc_poc/logic/cubit/counter_cubit.dart';
import 'package:cubit_bloc_poc/presentation/screens/home_screen.dart';
import 'package:cubit_bloc_poc/presentation/screens/second_screen.dart';
import 'package:cubit_bloc_poc/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(title: 'Home Screen', color: Colors.red)));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child:
                    SecondScreen(title: 'Home Screen', color: Colors.amber)));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: ThirdScreen(
                    title: 'Home Screen', color: Colors.greenAccent)));
        break;
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
