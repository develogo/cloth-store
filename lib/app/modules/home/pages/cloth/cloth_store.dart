import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cloth_store.g.dart';

class ClothStore = _ClothStoreBase with _$ClothStore;

abstract class _ClothStoreBase with Store {
  @observable
  PageController pageController = PageController();

  @observable
  int index = 0;

  @action
  void changePage(int v) {
    index = v;
  }
}
