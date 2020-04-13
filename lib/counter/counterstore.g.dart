// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counterstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStore on _CounterStoreStore, Store {
  Computed<Color> _$bcolorComputed;

  @override
  Color get bcolor =>
      (_$bcolorComputed ??= Computed<Color>(() => super.bcolor)).value;

  final _$counterAtom = Atom(name: '_CounterStoreStore.counter');

  @override
  int get counter {
    _$counterAtom.context.enforceReadPolicy(_$counterAtom);
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.conditionallyRunInAction(() {
      super.counter = value;
      _$counterAtom.reportChanged();
    }, _$counterAtom, name: '${_$counterAtom.name}_set');
  }

  final _$_CounterStoreStoreActionController =
      ActionController(name: '_CounterStoreStore');

  @override
  void increment() {
    final _$actionInfo = _$_CounterStoreStoreActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_CounterStoreStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CounterStoreStoreActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$_CounterStoreStoreActionController.endAction(_$actionInfo);
    }
  }
}
