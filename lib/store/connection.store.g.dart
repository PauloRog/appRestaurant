// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectionStore on _ConnectionStoreBase, Store {
  final _$connectionAtom = Atom(name: '_ConnectionStoreBase.connection');

  @override
  ConnectivityResult get connection {
    _$connectionAtom.context.enforceReadPolicy(_$connectionAtom);
    _$connectionAtom.reportObserved();
    return super.connection;
  }

  @override
  set connection(ConnectivityResult value) {
    _$connectionAtom.context.conditionallyRunInAction(() {
      super.connection = value;
      _$connectionAtom.reportChanged();
    }, _$connectionAtom, name: '${_$connectionAtom.name}_set');
  }

  final _$_ConnectionStoreBaseActionController =
      ActionController(name: '_ConnectionStoreBase');

  @override
  void getConnection() {
    final _$actionInfo = _$_ConnectionStoreBaseActionController.startAction();
    try {
      return super.getConnection();
    } finally {
      _$_ConnectionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'connection: ${connection.toString()}';
    return '{$string}';
  }
}
