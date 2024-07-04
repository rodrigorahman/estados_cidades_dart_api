import 'package:shorebird_redis_client/shorebird_redis_client.dart';

class RedisCache {
  static RedisCache? _instance;

  late final RedisClient redis;

  RedisCache._() {
    redis = RedisClient(
        socket:
            RedisSocketOptions(host: 'localhost', port: 6379, password: 'adf'));
  }

  static RedisCache get instance => _instance ??= RedisCache._();

  Future<void> put(String key, String value, Duration ttl) async {
    await redis.connect();
    await redis.set(key: key, value: value, ttl: ttl);
  }

  Future<String?> get(String key) async {
    await redis.connect();
    return await redis.get(key: key);
  }
}
