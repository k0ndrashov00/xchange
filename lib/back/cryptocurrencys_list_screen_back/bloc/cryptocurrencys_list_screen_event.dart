part of 'cryptocurrencys_list_screen_bloc.dart';

class CryptocurrencysListScreenEvent {}

class LoadCryptocurrencysList extends CryptocurrencysListScreenEvent {
  final Completer? completer;

  LoadCryptocurrencysList({
    this.completer
  });
}

