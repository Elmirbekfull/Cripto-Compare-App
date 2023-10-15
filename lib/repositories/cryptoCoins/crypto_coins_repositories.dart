import 'package:crypto_coins_list/repositories/cryptoCoins/cryptoCoins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepisitory {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final responce = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,XRP,SOL,USDT,BUSD,USDC,LOOM&tsyms=USD");
    final data = responce.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
      final price = usdData["PRICE"];
      final imageUrl = usdData["IMAGEURL"];
      return CryptoCoin(
          imageUrl: "https://www.cryptocompare.com/$imageUrl",
          name: e.key,
          priceinUSD: price);
    }).toList();
    return cryptoCoinsList;
  }
}
