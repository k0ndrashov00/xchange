import 'package:json_annotation/json_annotation.dart';

part 'second_cryptocurrency_model.g.dart';

@JsonSerializable()
class SecondCryptocurrencyModel {
  @JsonKey(name: 'IMAGEURL')
  final String cryptocurrencyImageUrl;
  @JsonKey(name: 'FROMSYMBOL')
  final String cryptocurrencyName;
  @JsonKey(name: 'PRICE')
  final double cryptocurrencyPrice;
  @JsonKey(name: 'HIGH24HOUR')
  final double cryptocurrencyHigh24Hour;
  @JsonKey(name: 'LOW24HOUR')
  final double cryptocurrencyLow24Hour;

  SecondCryptocurrencyModel({
    required this.cryptocurrencyImageUrl, 
    required this.cryptocurrencyName, 
    required this.cryptocurrencyPrice,
    required this.cryptocurrencyHigh24Hour,
    required this.cryptocurrencyLow24Hour
  });

  String get fullCryptocurrencyImageUrl => 'https://www.cryptocompare.com/$cryptocurrencyImageUrl';

  factory SecondCryptocurrencyModel.fromJson(Map<String, dynamic> json) => _$SecondCryptocurrencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$SecondCryptocurrencyModelToJson(this);
}