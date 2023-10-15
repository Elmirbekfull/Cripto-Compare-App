import 'dart:async';

import 'package:crypto_coins_list/repositories/cryptoCoins/cryptoCoins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepisitory) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CriptoListLoading());
        }
        emit(CriptoListLoading());
        final coinsList = await coinsRepisitory.getCoinsList();
        emit(CryptoListLoaded(coinList: coinsList));
      } on Exception catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractCoinsRepisitory coinsRepisitory;
}
