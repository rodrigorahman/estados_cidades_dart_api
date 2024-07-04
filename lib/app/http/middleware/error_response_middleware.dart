import 'package:vania/vania.dart';

class ErrorResponseMiddleware extends Middleware {
  @override
  handle(Request req) async {
    if (req.header('content-type') != 'application/json') {
      abort(500, 'Internal server error');
    }
    return next?.handle(req);
  }
}
