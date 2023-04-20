import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _transactionHashes =
        prefs.getStringList('ff_transactionHashes') ?? _transactionHashes;
    _lastUpdateTimestamp = prefs.containsKey('ff_lastUpdateTimestamp')
        ? DateTime.fromMillisecondsSinceEpoch(
            prefs.getInt('ff_lastUpdateTimestamp')!)
        : _lastUpdateTimestamp;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _blockchainUrl = '';
  String get blockchainUrl => _blockchainUrl;
  set blockchainUrl(String _value) {
    _blockchainUrl = _value;
  }

  String _contractAddress = '';
  String get contractAddress => _contractAddress;
  set contractAddress(String _value) {
    _contractAddress = _value;
  }

  String _ethPrivateKey = '';
  String get ethPrivateKey => _ethPrivateKey;
  set ethPrivateKey(String _value) {
    _ethPrivateKey = _value;
  }

  String _className = '';
  String get className => _className;
  set className(String _value) {
    _className = _value;
  }

  List<String> _transactionHashes = [];
  List<String> get transactionHashes => _transactionHashes;
  set transactionHashes(List<String> _value) {
    _transactionHashes = _value;
    prefs.setStringList('ff_transactionHashes', _value);
  }

  void addToTransactionHashes(String _value) {
    _transactionHashes.add(_value);
    prefs.setStringList('ff_transactionHashes', _transactionHashes);
  }

  void removeFromTransactionHashes(String _value) {
    _transactionHashes.remove(_value);
    prefs.setStringList('ff_transactionHashes', _transactionHashes);
  }

  void removeAtIndexFromTransactionHashes(int _index) {
    _transactionHashes.removeAt(_index);
    prefs.setStringList('ff_transactionHashes', _transactionHashes);
  }

  DateTime? _lastUpdateTimestamp;
  DateTime? get lastUpdateTimestamp => _lastUpdateTimestamp;
  set lastUpdateTimestamp(DateTime? _value) {
    _lastUpdateTimestamp = _value;
    _value != null
        ? prefs.setInt('ff_lastUpdateTimestamp', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastUpdateTimestamp');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
