part of 'cryptocurrency_screen_bloc.dart';

class CryptocurrencyScreenState {}

class CryptocurrencyDataInitial extends CryptocurrencyScreenState {}

class CryptocurrencyDataLoading extends CryptocurrencyScreenState {}

class CryptocurrencyDataLoaded extends CryptocurrencyScreenState {
  final CryptocurrencyModelForCryptocurrencyScreen cryptocurrencyData;

  CryptocurrencyDataLoaded({required this.cryptocurrencyData});
}

class CryptocurrencyDataLoadingFailure extends CryptocurrencyScreenState {}