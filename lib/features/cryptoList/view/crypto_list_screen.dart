import 'dart:async';

import 'package:crypto_coins_list/features/cryptoList/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/features/cryptoList/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/cryptoCoins/cryptoCoins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepisitory>());
  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList(completer: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Криптовалютное сравнение",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 10),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.coinList.length,
                    itemBuilder: (context, index) {
                      final coin = state.coinList[index];
                      return CryptoCoinTile(
                        coin: coin,
                      );
                    });
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/icons/error.json",
                        height: 300,
                      ),
                      const Text(
                        "Что-то пошло не так",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Пожалуйста, повторите попытку позже",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            _cryptoListBloc
                                .add(LoadCryptoList(completer: null));
                          },
                          child: const Text("Повторить снова"))
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
