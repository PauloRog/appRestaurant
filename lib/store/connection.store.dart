import 'package:mobx/mobx.dart';
import 'package:connectivity/connectivity.dart';
part 'connection.store.g.dart';

class ConnectionStore = _ConnectionStoreBase with _$ConnectionStore;

abstract class _ConnectionStoreBase with Store {
  @observable
  ConnectivityResult connection;

  @action
  void getConnection() {
    this.connection = null;
    _checkConnection().then((value) {
      this.connection = value;
    });
  }

  Future<ConnectivityResult> _checkConnection() async {
    var connection = await Connectivity().checkConnectivity();
    return connection;
  }
}