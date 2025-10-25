import 'package:dio/dio.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/first_cryptocurrency_model.dart';

class FirstApiRequest {
  Future<List<FirstCryptocurrencyModel>> firstApiRequest() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDT,LTC&tsyms=USD');

    final responseData = response.data;

    final btcData = responseData['RAW']['BTC']['USD'];
    final ethData = responseData['RAW']['ETH']['USD'];
    final bnbData = responseData['RAW']['BNB']['USD'];
    final usdtData = responseData['RAW']['USDT']['USD'];
    final ltcData = responseData['RAW']['LTC']['USD'];

    final btc = FirstCryptocurrencyModel.fromJson(btcData);
    final eth = FirstCryptocurrencyModel.fromJson(ethData);
    final bnb = FirstCryptocurrencyModel.fromJson(bnbData);
    final usdt = FirstCryptocurrencyModel.fromJson(usdtData);
    final ltc = FirstCryptocurrencyModel.fromJson(ltcData);

    List<FirstCryptocurrencyModel> cryptocurrencysList = [btc, eth, bnb, usdt, ltc];

    return cryptocurrencysList;
  }
}