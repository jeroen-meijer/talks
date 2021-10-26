import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxintroduction/redux.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Counter value:',
            ),
            StoreConnector<AppState, int>(
              converter: (store) => store.state.counter,
              builder: (BuildContext context, int counterValue) {
                return new Text(
                  '$counterValue',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 70.0),
                );
              },
            ),
            StoreConnector<AppState, Store>(
              converter: (store) => store,
              builder: (BuildContext context, Store store) {
                return Column(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        store.dispatch(IncrementCounter());
                      },
                      child: Text('Add 1'),
                    ),
                    TextButton(
                      onPressed: () {
                        store.dispatch(IncrementCounter(amount: 5));
                      },
                      child: Text('Add 5'),
                    ),
                    TextButton(
                      onPressed: () {
                        store.dispatch(IncrementCounter(amount: -10));
                      },
                      child: Text('Subtract 10'),
                    ),
                    TextButton(
                      onPressed: () {
                        store.dispatch(Init());
                      },
                      child: Text('Reset'),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
