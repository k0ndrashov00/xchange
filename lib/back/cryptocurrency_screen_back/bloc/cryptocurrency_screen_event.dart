part of 'cryptocurrency_screen_bloc.dart';

class CryptocurrencyScreenEvent {}

class LoadCryptocurrencyData extends CryptocurrencyScreenEvent {
  final String cryptocurrencyName;

  LoadCryptocurrencyData({required this.cryptocurrencyName,});
}