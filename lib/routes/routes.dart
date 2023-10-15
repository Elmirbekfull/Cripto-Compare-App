import 'package:crypto_coins_list/features/cryptoCoin/cryptoCoin.dart';
import 'package:crypto_coins_list/features/cryptoList/cryptoList.dart';

final routes = {
  "/": (context) => const CryptoListScreen(),
  "/coin": (context) => const CryptoCoinScreen()
};
