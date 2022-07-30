import 'package:binder/binder.dart';

class User {
  User(this.firstName, this.lastName, this.score);

  final String firstName;
  final String lastName;
  final int score;
}

final userRef = StateRef(User('', '', 0));
final loadingRef = StateRef(false);

final userLogicRef = LogicRef((scope) => UserLogic(scope));

class UserLogic with Logic implements Loadable {
  UserLogic(this.scope);

  @override
  final Scope scope;

  @override
  Future<void> load() async {
    write(loadingRef, true);
    await Future.delayed(
      const Duration(milliseconds: 10000),
    );
    write(
      userRef,
      User('Jane', 'Helen', 100),
    );
    write(loadingRef, false);
  }
}
