import 'dart:convert';

import 'package:adf_desafio_estados/app/models/city_model.dart';
import 'package:adf_desafio_estados/app/models/state_model.dart';
import 'package:adf_desafio_estados/cache/redis_cache.dart';

const _statesKey = 'STATES_KEY';
const _cityKey = 'CITY_KEY';

class LocationCacheDataSource {
  Future<List<StateModel>> getCachedStates() async {
    final statesCache = await RedisCache.instance.get(_statesKey);
    return switch (statesCache) {
      != null && String(isNotEmpty: true) =>
        jsonDecode(statesCache).map<StateModel>((s) => StateModel.fromMap(s)).toList(),
      _ => []
    };
  }

  Future<List<CityModel>> getCachedCitiesByState(String state) async {
    final citiesCache = await RedisCache.instance.get('${state}_$_cityKey');

    return switch (citiesCache) {
      != null && String(isNotEmpty: true) =>
        jsonDecode(citiesCache).map<CityModel>((s) => CityModel.fromMap(s)).toList(),
      _ => []
    };
  }

  Future<void> setCachedStates(List<StateModel> states) async {
    final data = jsonEncode(states.map((s) => s.toMap()).toList());
    RedisCache.instance.put(_statesKey, data, Duration(days: 180));
  }

  Future<void> setCachedCities(String state, List<CityModel> cities) async {
    final data = jsonEncode(cities.map((s) => s.toMap()).toList());
    RedisCache.instance.put('${state}_$_cityKey', data, Duration(days: 90));
  }
}
