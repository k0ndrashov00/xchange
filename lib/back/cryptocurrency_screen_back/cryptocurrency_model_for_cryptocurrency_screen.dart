import 'package:json_annotation/json_annotation.dart';

part 'cryptocurrency_model_for_cryptocurrency_screen.g.dart';

@JsonSerializable()
class CryptocurrencyModelForCryptocurrencyScreen {
  @JsonKey(name: 'IMAGEURL')
  final String cryptocurrencyImageUrl;
  @JsonKey(name: 'PRICE')
  final double cryptocurrencyPrice;
  @JsonKey(name: 'HIGH24HOUR')
  final double cryptocurrencyHigh24Hour;
  @JsonKey(name: 'LOW24HOUR')
  final double cryptocurrencyLow24Hour;

  CryptocurrencyModelForCryptocurrencyScreen({
    required this.cryptocurrencyImageUrl,
    required this.cryptocurrencyPrice,
    required this.cryptocurrencyHigh24Hour,
    required this.cryptocurrencyLow24Hour
  });

  String get fullCryptocurrencyImageUrl => 'https://www.cryptocompare.com/$cryptocurrencyImageUrl';

  factory CryptocurrencyModelForCryptocurrencyScreen.fromJson(Map<String, dynamic> json) => _$CryptocurrencyModelForCryptocurrencyScreenFromJson(json);
  Map<String, dynamic> toJson() => _$CryptocurrencyModelForCryptocurrencyScreenToJson(this);
}