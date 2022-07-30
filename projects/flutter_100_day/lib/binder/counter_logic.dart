import 'package:binder/binder.dart';

final counterRef = StateRef(0);

final counterViewLogicRef = LogicRef((scope) => CounterViewLogic(scope));

/// A business logic component can apply the [Logic] mixin to have access to
/// useful methods, such as `write` and `read`.
class CounterViewLogic with Logic {
  const CounterViewLogic(this.scope);

  /// This is the object which is able to interact with other components.
  @override
  final Scope scope;

  /// We can use the [write] method to mutate the state referenced by a
  /// [StateRef] and [read] to obtain its current state.
  void increment() => write(counterRef, read(counterRef) + 1);
}
