import 'package:crypto_coins_list/criptoListApp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repositories/cryptoCoins/cryptoCoins.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepisitory>(
    () => CryptoCoinsRepository(dio: Dio()),
  );
  runApp(
    const CriptoCurrenciesListApp(),
  );
}
