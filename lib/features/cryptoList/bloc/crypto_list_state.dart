part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  List<Object?> get props => [];
}

class CriptoListLoading extends CryptoListState {
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  List<Object?> get props => [coinList];
  final List<CryptoCoin> coinList;
  CryptoListLoaded({required this.coinList});
}

class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;
  List<Object?> get props => [exception];
  CryptoListLoadingFailure({required this.exception});
}
