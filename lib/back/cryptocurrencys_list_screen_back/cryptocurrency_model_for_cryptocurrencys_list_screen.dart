import 'package:json_annotation/json_annotation.dart';

part 'cryptocurrency_model_for_cryptocurrencys_list_screen.g.dart';

@JsonSerializable()
class CryptocurrencyModelForCryptocurrencysListScreen {
  @JsonKey(name: 'IMAGEURL')
  final String cryptocurrencyImageUrl;
  @JsonKey(name: 'FROMSYMBOL')
  final String cryptocurrencyName;
  @JsonKey(name: 'PRICE')
  final double cryptocurrencyPrice;

  CryptocurrencyModelForCryptocurrencysListScreen({
    required this.cryptocurrencyImageUrl, 
    required this.cryptocurrencyName, 
    required this.cryptocurrencyPrice
  });

  String get fullCryptocurrencyImageUrl => 'https://www.cryptocompare.com/$cryptocurrencyImageUrl';

  factory CryptocurrencyModelForCryptocurrencysListScreen.fromJson(Map<String, dynamic> json) => _$CryptocurrencyModelForCryptocurrencysListScreenFromJson(json);
  Map<String, dynamic> toJson() => _$CryptocurrencyModelForCryptocurrencysListScreenToJson(this);
}