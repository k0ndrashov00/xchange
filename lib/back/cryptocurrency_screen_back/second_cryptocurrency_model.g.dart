// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_cryptocurrency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondCryptocurrencyModel _$SecondCryptocurrencyModelFromJson(
  Map<String, dynamic> json,
) => SecondCryptocurrencyModel(
  cryptocurrencyImageUrl: json['IMAGEURL'] as String,
  cryptocurrencyName: json['FROMSYMBOL'] as String,
  cryptocurrencyPrice: (json['PRICE'] as num).toDouble(),
  cryptocurrencyHigh24Hour: (json['HIGH24HOUR'] as num).toDouble(),
  cryptocurrencyLow24Hour: (json['LOW24HOUR'] as num).toDouble(),
);

Map<String, dynamic> _$SecondCryptocurrencyModelToJson(
  SecondCryptocurrencyModel instance,
) => <String, dynamic>{
  'IMAGEURL': instance.cryptocurrencyImageUrl,
  'FROMSYMBOL': instance.cryptocurrencyName,
  'PRICE': instance.cryptocurrencyPrice,
  'HIGH24HOUR': instance.cryptocurrencyHigh24Hour,
  'LOW24HOUR': instance.cryptocurrencyLow24Hour,
};
