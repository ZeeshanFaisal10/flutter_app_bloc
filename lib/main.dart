import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/CounterEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => CounterBloc(0),
          child: CounterScreen(),
        ),
      ),
    );
  }
}
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return SafeArea(
      child: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc,int>(builder: (BuildContext context, int state){
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                );
              } ),

              RaisedButton(onPressed: (){
                _counterBloc.add(CounterEvent.increment);
              },
                child: Text("Increment"),
              ),

              RaisedButton(onPressed: (){
                _counterBloc.add(CounterEvent.decrement);
              },
                child: Text("Decrement"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

