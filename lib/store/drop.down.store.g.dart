// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop.down.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DropDownStore on _DropDownStoreBase, Store {
  final _$selectAtom = Atom(name: '_DropDownStoreBase.select');

  @override
  String get select {
    _$selectAtom.context.enforceReadPolicy(_$selectAtom);
    _$selectAtom.reportObserved();
    return super.select;
  }

  @override
  set select(String value) {
    _$selectAtom.context.conditionallyRunInAction(() {
      super.select = value;
      _$selectAtom.reportChanged();
    }, _$selectAtom, name: '${_$selectAtom.name}_set');
  }

  final _$_DropDownStoreBaseActionController =
      ActionController(name: '_DropDownStoreBase');

  @override
  void selectOption(String item) {
    final _$actionInfo = _$_DropDownStoreBaseActionController.startAction();
    try {
      return super.selectOption(item);
    } finally {
      _$_DropDownStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'select: ${select.toString()}';
    return '{$string}';
  }
}
