import 'package:dio/dio.dart';
import 'package:xchange/back/cryptocurrency_screen_back/second_cryptocurrency_model.dart';

class SecondApiRequets {
  final String cryptocurrencyName;

  SecondApiRequets({required this.cryptocurrencyName});

  Future<SecondCryptocurrencyModel> secondApiRequest() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$cryptocurrencyName&tsyms=USD');

    final responseData = response.data;

    final cryptocurrencyData = responseData['RAW'][cryptocurrencyName]['USD'];

    final cryptocurrency = SecondCryptocurrencyModel.fromJson(cryptocurrencyData);

    return cryptocurrency;
  }
}