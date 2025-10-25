import 'package:json_annotation/json_annotation.dart';

part 'first_cryptocurrency_model.g.dart';

@JsonSerializable()
class FirstCryptocurrencyModel {
  @JsonKey(name: 'IMAGEURL')
  final String cryptocurrencyImageUrl;
  @JsonKey(name: 'FROMSYMBOL')
  final String cryptocurrencyName;
  @JsonKey(name: 'PRICE')
  final double cryptocurrencyPrice;

  FirstCryptocurrencyModel({
    required this.cryptocurrencyImageUrl, 
    required this.cryptocurrencyName, 
    required this.cryptocurrencyPrice
  });

  String get fullCryptocurrencyImageUrl => 'https://www.cryptocompare.com/$cryptocurrencyImageUrl';

  factory FirstCryptocurrencyModel.fromJson(Map<String, dynamic> json) => _$FirstCryptocurrencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$FirstCryptocurrencyModelToJson(this);
}