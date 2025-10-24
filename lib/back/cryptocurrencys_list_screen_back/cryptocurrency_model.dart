import 'package:json_annotation/json_annotation.dart';

part 'cryptocurrency_model.g.dart';

@JsonSerializable()
class CryptocurrencyModel {
  @JsonKey(name: 'IMAGEURL')
  final String cryptocurrencyImageUrl;
  @JsonKey(name: 'FROMSYMBOL')
  final String cryptocurrencyName;
  @JsonKey(name: 'PRICE')
  final double cryptocurrencyPrice;

  CryptocurrencyModel({
    required this.cryptocurrencyImageUrl, 
    required this.cryptocurrencyName, 
    required this.cryptocurrencyPrice
  });

  String get fullCryptocurrencyImageUrl => 'https://www.cryptocompare.com/$cryptocurrencyImageUrl';

  factory CryptocurrencyModel.fromJson(Map<String, dynamic> json) => _$CryptocurrencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CryptocurrencyModelToJson(this);
}