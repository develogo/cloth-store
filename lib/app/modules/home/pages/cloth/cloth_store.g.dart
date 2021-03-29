// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClothStore on _ClothStoreBase, Store {
  final _$pageControllerAtom = Atom(name: '_ClothStoreBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$indexAtom = Atom(name: '_ClothStoreBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$_ClothStoreBaseActionController =
      ActionController(name: '_ClothStoreBase');

  @override
  void changePage(int v) {
    final _$actionInfo = _$_ClothStoreBaseActionController.startAction(
        name: '_ClothStoreBase.changePage');
    try {
      return super.changePage(v);
    } finally {
      _$_ClothStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
index: ${index}
    ''';
  }
}
