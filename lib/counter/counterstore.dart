import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'counterstore.g.dart';

class CounterStore extends _CounterStoreStore with _$CounterStore {}

abstract class _CounterStoreStore with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }

  @action
  void decrement() {
    counter--;
  }

  @computed
  Color get bcolor {
    return Colors.red[(counter % 10) * 100];
  }
}
