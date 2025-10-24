import 'package:dio/dio.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/cryptocurrency_model.dart';

class ApiRequest {
  Future<List<CryptocurrencyModel>> apiRequest() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDT,LTC&tsyms=USD');

    final responseData = response.data;

    final btcData = responseData['RAW']['BTC']['USD'];
    final ethData = responseData['RAW']['ETH']['USD'];
    final bnbData = responseData['RAW']['BNB']['USD'];
    final usdtData = responseData['RAW']['USDT']['USD'];
    final ltcData = responseData['RAW']['LTC']['USD'];

    final btc = CryptocurrencyModel.fromJson(btcData);
    final eth = CryptocurrencyModel.fromJson(ethData);
    final bnb = CryptocurrencyModel.fromJson(bnbData);
    final usdt = CryptocurrencyModel.fromJson(usdtData);
    final ltc = CryptocurrencyModel.fromJson(ltcData);

    List<CryptocurrencyModel> cryptocurrencysList = [btc, eth, bnb, usdt, ltc];

    return cryptocurrencysList;
  }
}