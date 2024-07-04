import 'package:adf_desafio_estados/app/data/datasource/brasil_api_data_source_api.dart';
import 'package:adf_desafio_estados/app/data/datasource/location_cache_data_source.dart';
import 'package:adf_desafio_estados/app/models/city_model.dart';
import 'package:adf_desafio_estados/app/models/state_model.dart';

class LocationRepository {
  final _locationCache = LocationCacheDataSource();
  final _brasilApiDataSource = BrasilApiDataSourceApi();

  Future<List<StateModel>> getStates() async {
    var states = await _locationCache.getCachedStates();

    if (states.isEmpty) {
      print("Bateu no backend");
      states = await _brasilApiDataSource.getStates();
      if (states.isNotEmpty) {
        _locationCache.setCachedStates(states);
      }
    }else {
      print("Pegou do cache de Estados");
    }

    return states;
  }

  Future<List<CityModel>> getCitiesByState(String state) async {
    var cities = await _locationCache.getCachedCitiesByState(state);
    if (cities.isEmpty) {
      cities = await _brasilApiDataSource.getCitiesByState(state);
      _locationCache.setCachedCities(state, cities);
    }
    return cities;
  }
}
