import 'package:crypto_coins_list/repositories/cryptoCoins/models/crypto_coin.dart';

abstract class AbstractCoinsRepisitory {
  Future<List<CryptoCoin>> getCoinsList();
}
