part of 'cryptocurrency_screen_bloc.dart';

class CryptocurrencyScreenEvent {}

class LoadCryptocurrencyData extends CryptocurrencyScreenEvent {
  final String cryptocurrencyName;
  final Completer? completer;

  LoadCryptocurrencyData({
    required this.cryptocurrencyName,
    this.completer
  });
}