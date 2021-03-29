// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$categoriesAtom = Atom(name: 'HomeStoreBase.categories');

  @override
  List<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$products1Atom = Atom(name: 'HomeStoreBase.products1');

  @override
  List<String> get products1 {
    _$products1Atom.reportRead();
    return super.products1;
  }

  @override
  set products1(List<String> value) {
    _$products1Atom.reportWrite(value, super.products1, () {
      super.products1 = value;
    });
  }

  @override
  String toString() {
    return '''
categories: ${categories},
products1: ${products1}
    ''';
  }
}
