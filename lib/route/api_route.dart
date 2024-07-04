import 'package:vania/vania.dart';

import '../app/http/controllers/location_controller.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.get("/states", locationController.getStates);
    Router.get("/cities/{state}", locationController.getCitiesByState);

  }
}
