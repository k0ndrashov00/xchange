// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptocurrencyModel _$CryptocurrencyModelFromJson(Map<String, dynamic> json) =>
    CryptocurrencyModel(
      cryptocurrencyImageUrl: json['IMAGEURL'] as String,
      cryptocurrencyName: json['FROMSYMBOL'] as String,
      cryptocurrencyPrice: (json['PRICE'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptocurrencyModelToJson(
  CryptocurrencyModel instance,
) => <String, dynamic>{
  'IMAGEURL': instance.cryptocurrencyImageUrl,
  'FROMSYMBOL': instance.cryptocurrencyName,
  'PRICE': instance.cryptocurrencyPrice,
};
