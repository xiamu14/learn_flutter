import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_100_day/binder/user_login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'binder/counter_logic.dart';

dotEnvLoad() async {
  const env = String.fromEnvironment('ENV');
  await dotenv.load(fileName: ".env.$env");
}

void main() async {
  await dotEnvLoad();
  runApp(
    const BinderScope(
      child: MaterialApp(home: CounterView()),
    ),
  );
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = context.watch(counterRef);

    return Scaffold(
      appBar: AppBar(title: const Text('Binder example')),
      body: Center(
        child: Column(
          children: [
            LogicLoader(
              refs: [userLogicRef],
              child: const UserView(),
            ),
            const Text('add'),
            Text('$counter', style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.use(counterViewLogicRef).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
        watchable:
            userRef.select((state) => '${state.firstName} ${state.lastName}'),
        builder: (context, String fullName, child) {
          return Text(fullName);
        },
      ),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = context.watch(loadingRef);
    if (loading) {
      return const CircularProgressIndicator();
    }

    return Center(
      child: Consumer(
        watchable:
            userRef.select((state) => '${state.firstName} ${state.lastName}'),
        builder: (context, String ref, child) {
          return Text(ref, style: const TextStyle(color: Colors.red));
        },
      ),
    );
  }
}
