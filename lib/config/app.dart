import 'package:vania/vania.dart';
import 'package:adf_desafio_estados/app/providers/route_service_povider.dart';

import 'cors.dart';

Map<String, dynamic> config = {
  'name': env('APP_NAME'),
  'url': env('APP_URL'),
  'timezone': '',
  'cors': cors,
  'providers': <ServiceProvider>[
    RouteServiceProvider(),
  ],
};
