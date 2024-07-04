import 'package:adf_desafio_estados/app/data/repository/location_repository.dart';
import 'package:vania/vania.dart';

class LocationController extends Controller {
  Future<Response> getStates() async {
    final states = await LocationRepository().getStates();
    return Response.json(states.map((s) => s.toMap()).toList());
  }

  Future<Response> getCitiesByState(String state) async {
    final states = await LocationRepository().getCitiesByState(state);
    return Response.json(states.map((s) => s.toMap()).toList());
  }
}

final LocationController locationController = LocationController();
