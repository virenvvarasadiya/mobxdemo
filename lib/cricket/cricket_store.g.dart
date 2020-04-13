// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cricket_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CricketStore on _CricketStore, Store {
  Computed<StoreStatus> _$statusComputed;

  @override
  StoreStatus get status =>
      (_$statusComputed ??= Computed<StoreStatus>(() => super.status)).value;

  final _$cricketerAtom = Atom(name: '_CricketStore.cricketer');

  @override
  Cricketer get cricketer {
    _$cricketerAtom.context.enforceReadPolicy(_$cricketerAtom);
    _$cricketerAtom.reportObserved();
    return super.cricketer;
  }

  @override
  set cricketer(Cricketer value) {
    _$cricketerAtom.context.conditionallyRunInAction(() {
      super.cricketer = value;
      _$cricketerAtom.reportChanged();
    }, _$cricketerAtom, name: '${_$cricketerAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_CricketStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_observableFutureAtom = Atom(name: '_CricketStore._observableFuture');

  @override
  ObservableFuture<Cricketer> get _observableFuture {
    _$_observableFutureAtom.context.enforceReadPolicy(_$_observableFutureAtom);
    _$_observableFutureAtom.reportObserved();
    return super._observableFuture;
  }

  @override
  set _observableFuture(ObservableFuture<Cricketer> value) {
    _$_observableFutureAtom.context.conditionallyRunInAction(() {
      super._observableFuture = value;
      _$_observableFutureAtom.reportChanged();
    }, _$_observableFutureAtom, name: '${_$_observableFutureAtom.name}_set');
  }

  final _$getCricketerScoreAsyncAction = AsyncAction('getCricketerScore');

  @override
  Future getCricketerScore(String _name) {
    return _$getCricketerScoreAsyncAction
        .run(() => super.getCricketerScore(_name));
  }
}
