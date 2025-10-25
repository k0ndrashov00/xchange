// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_cryptocurrency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstCryptocurrencyModel _$FirstCryptocurrencyModelFromJson(
  Map<String, dynamic> json,
) => FirstCryptocurrencyModel(
  cryptocurrencyImageUrl: json['IMAGEURL'] as String,
  cryptocurrencyName: json['FROMSYMBOL'] as String,
  cryptocurrencyPrice: (json['PRICE'] as num).toDouble(),
);

Map<String, dynamic> _$FirstCryptocurrencyModelToJson(
  FirstCryptocurrencyModel instance,
) => <String, dynamic>{
  'IMAGEURL': instance.cryptocurrencyImageUrl,
  'FROMSYMBOL': instance.cryptocurrencyName,
  'PRICE': instance.cryptocurrencyPrice,
};
