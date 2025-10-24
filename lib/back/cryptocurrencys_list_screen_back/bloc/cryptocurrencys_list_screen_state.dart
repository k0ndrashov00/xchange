part of 'cryptocurrencys_list_screen_bloc.dart';

class CryptocurrencysListScreenState {}

class CryptocurrencysListInitial extends CryptocurrencysListScreenState {}

class CryptocurrencysListLoading extends CryptocurrencysListScreenState {}

class CryptocurrencysListLoaded extends CryptocurrencysListScreenState {
  final List<CryptocurrencyModel> cryptocurrencysList;

  CryptocurrencysListLoaded({required this.cryptocurrencysList});
}

class CryptocurrencysListLoadingFailure extends CryptocurrencysListScreenState {}