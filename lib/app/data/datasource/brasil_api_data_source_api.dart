import 'package:adf_desafio_estados/app/models/city_model.dart';
import 'package:adf_desafio_estados/app/models/state_model.dart';
import 'package:dio/dio.dart';


class BrasilApiDataSourceApi {
  Future<List<StateModel>> getStates() async {
    final Response(:List data) = await Dio().get(
      'https://brasilapi.com.br/api/ibge/uf/v1',
    );
    return data.map((s) => StateModel.fromMap(s)).toList();
  }

  Future<List<CityModel>> getCitiesByState(String state) async {
    final Response(:List data) = await Dio().get(
      'https://brasilapi.com.br/api/ibge/municipios/v1/$state?providers=dados-abertos-br,gov,wikipedia',
    );
    return data.map((s) => CityModel.fromMap(s)).toList();
  }
}
