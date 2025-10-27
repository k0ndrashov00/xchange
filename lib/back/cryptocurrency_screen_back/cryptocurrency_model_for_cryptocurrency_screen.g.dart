// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency_model_for_cryptocurrency_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptocurrencyModelForCryptocurrencyScreen
_$CryptocurrencyModelForCryptocurrencyScreenFromJson(
  Map<String, dynamic> json,
) => CryptocurrencyModelForCryptocurrencyScreen(
  cryptocurrencyImageUrl: json['IMAGEURL'] as String,
  cryptocurrencyPrice: (json['PRICE'] as num).toDouble(),
  cryptocurrencyHigh24Hour: (json['HIGH24HOUR'] as num).toDouble(),
  cryptocurrencyLow24Hour: (json['LOW24HOUR'] as num).toDouble(),
);

Map<String, dynamic> _$CryptocurrencyModelForCryptocurrencyScreenToJson(
  CryptocurrencyModelForCryptocurrencyScreen instance,
) => <String, dynamic>{
  'IMAGEURL': instance.cryptocurrencyImageUrl,
  'PRICE': instance.cryptocurrencyPrice,
  'HIGH24HOUR': instance.cryptocurrencyHigh24Hour,
  'LOW24HOUR': instance.cryptocurrencyLow24Hour,
};
