// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency_model_for_cryptocurrencys_list_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptocurrencyModelForCryptocurrencysListScreen
_$CryptocurrencyModelForCryptocurrencysListScreenFromJson(
  Map<String, dynamic> json,
) => CryptocurrencyModelForCryptocurrencysListScreen(
  cryptocurrencyImageUrl: json['IMAGEURL'] as String,
  cryptocurrencyName: json['FROMSYMBOL'] as String,
  cryptocurrencyPrice: (json['PRICE'] as num).toDouble(),
);

Map<String, dynamic> _$CryptocurrencyModelForCryptocurrencysListScreenToJson(
  CryptocurrencyModelForCryptocurrencysListScreen instance,
) => <String, dynamic>{
  'IMAGEURL': instance.cryptocurrencyImageUrl,
  'FROMSYMBOL': instance.cryptocurrencyName,
  'PRICE': instance.cryptocurrencyPrice,
};
