import 'package:dio/dio.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/cryptocurrency_model_for_cryptocurrencys_list_screen.dart';

class ApiRequestForCryptocurrencysListScreen {
  Future<List<CryptocurrencyModelForCryptocurrencysListScreen>> apiRequestForCryptocurrencysListScreen() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDT,LTC&tsyms=USD');

    final responseData = response.data;

    final btcData = responseData['RAW']['BTC']['USD'];
    final ethData = responseData['RAW']['ETH']['USD'];
    final bnbData = responseData['RAW']['BNB']['USD'];
    final usdtData = responseData['RAW']['USDT']['USD'];
    final ltcData = responseData['RAW']['LTC']['USD'];

    final btc = CryptocurrencyModelForCryptocurrencysListScreen.fromJson(btcData);
    final eth = CryptocurrencyModelForCryptocurrencysListScreen.fromJson(ethData);
    final bnb = CryptocurrencyModelForCryptocurrencysListScreen.fromJson(bnbData);
    final usdt = CryptocurrencyModelForCryptocurrencysListScreen.fromJson(usdtData);
    final ltc = CryptocurrencyModelForCryptocurrencysListScreen.fromJson(ltcData);

    List<CryptocurrencyModelForCryptocurrencysListScreen> cryptocurrencysList = [btc, eth, bnb, usdt, ltc];

    return cryptocurrencysList;
  }
}