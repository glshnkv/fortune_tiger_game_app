import 'package:shared_preferences/shared_preferences.dart';

const String _kdiamondsKey = 'diamonds';
const String _kgiftsKey = 'gifts';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  dynamic _getData(String key) {
    var value = _preferences.get(key);

    print('Retrieved $key: $value');

    return value;
  }

  void _saveData(String key, dynamic value) {
    print('Saving $key: $value');

    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  int get diamonds => _getData(_kdiamondsKey) ?? 0;
  set diamonds(int value) => _saveData(_kdiamondsKey, value);

  int get gifts => _getData(_kgiftsKey) ?? 0;
  set gifts(int value) => _saveData(_kgiftsKey, value);
  
}