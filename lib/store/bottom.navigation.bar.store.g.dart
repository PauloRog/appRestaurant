// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom.navigation.bar.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomStore on _BottomStoreBase, Store {
  final _$indexAtom = Atom(name: '_BottomStoreBase.index');

  @override
  int get index {
    _$indexAtom.context.enforceReadPolicy(_$indexAtom);
    _$indexAtom.reportObserved();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.context.conditionallyRunInAction(() {
      super.index = value;
      _$indexAtom.reportChanged();
    }, _$indexAtom, name: '${_$indexAtom.name}_set');
  }

  final _$iconsAtom = Atom(name: '_BottomStoreBase.icons');

  @override
  List<MyIcon> get icons {
    _$iconsAtom.context.enforceReadPolicy(_$iconsAtom);
    _$iconsAtom.reportObserved();
    return super.icons;
  }

  @override
  set icons(List<MyIcon> value) {
    _$iconsAtom.context.conditionallyRunInAction(() {
      super.icons = value;
      _$iconsAtom.reportChanged();
    }, _$iconsAtom, name: '${_$iconsAtom.name}_set');
  }

  final _$_BottomStoreBaseActionController =
      ActionController(name: '_BottomStoreBase');

  @override
  void setIcons(String select) {
    final _$actionInfo = _$_BottomStoreBaseActionController.startAction();
    try {
      return super.setIcons(select);
    } finally {
      _$_BottomStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndex(int value) {
    final _$actionInfo = _$_BottomStoreBaseActionController.startAction();
    try {
      return super.setIndex(value);
    } finally {
      _$_BottomStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'index: ${index.toString()},icons: ${icons.toString()}';
    return '{$string}';
  }
}
