import 'package:cubit_bloc_poc/logic/cubit/counter_cubit.dart';
import 'package:cubit_bloc_poc/presentation/screens/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "AAHHH (-VE) " + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline2,
                  );
                }
              },
              listener: (context, state) {
                if (state.isIncremented == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Value has incremented'),
                    duration: Duration(microseconds: 5000),
                  ));
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Value has Decremented'),
                    duration: Duration(microseconds: 5000),
                  ));
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    //context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 50,
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context).pushNamed('/second'
                    // MaterialPageRoute(
                    //   builder: (_secondScreenContext) => BlocProvider.value(
                    //     value: BlocProvider.of<CounterCubit>(context),
                    //     child: SecondScreen(
                    //       title: 'My Second Screen',
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),
                    );
              },
              child: Text('Go to second Screen'),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context).pushNamed('/third'
                    // MaterialPageRoute(
                    //   builder: (_secondScreenContext) => BlocProvider.value(
                    //     value: BlocProvider.of<CounterCubit>(context),
                    //     child: SecondScreen(
                    //       title: 'My Third Screen',
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),
                    );
              },
              child: Text('Go to third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
