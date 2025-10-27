import 'package:dio/dio.dart';
import 'package:xchange/back/cryptocurrency_screen_back/cryptocurrency_model_for_cryptocurrency_screen.dart';

class ApiRequetsForCryptocurrencyScreen {
  final String cryptocurrencyName;

  ApiRequetsForCryptocurrencyScreen({required this.cryptocurrencyName});

  Future<CryptocurrencyModelForCryptocurrencyScreen> apiRequetsForCryptocurrencyScreen() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$cryptocurrencyName&tsyms=USD');

    final responseData = response.data;

    final cryptocurrencyData = responseData['RAW'][cryptocurrencyName]['USD'];

    final cryptocurrency = CryptocurrencyModelForCryptocurrencyScreen.fromJson(cryptocurrencyData);

    return cryptocurrency;
  }
}