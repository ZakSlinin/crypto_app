import 'package:crypto_app/repositories/crypto_coins%20/models/crypto_coin.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}