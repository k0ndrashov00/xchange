import 'package:flutter/material.dart';
import 'package:xchange/back/cryptocurrency_screen_back/bloc/cryptocurrency_screen_bloc.dart';
import 'package:xchange/front/theme.dart';

class CryptocurrencyLoadingFailureWidget extends StatelessWidget {
  final CryptocurrencyScreenBloc cryptocurrencyScreenBlocInstance;
  final String cryptocurrecyName;

  const CryptocurrencyLoadingFailureWidget({
    super.key,
    required this.cryptocurrencyScreenBlocInstance,
    required this.cryptocurrecyName
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * secondTextSize,
              fontWeight: fontWeight,
              color: firstTextColor 
            )
          ),
          Text(
            'Please try again later',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * fourthTextSize,
              fontWeight: fontWeight,
              color: secondTextColor
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: tryAgainButtonBackgroundColor),
            child: Text(
              'Try again now', 
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * secondTextSize,
                fontWeight: fontWeight,
                color: firstTextColor
              )
            ),
            onPressed: () {cryptocurrencyScreenBlocInstance.add(LoadCryptocurrencyData(cryptocurrencyName: cryptocurrecyName));},
          )
        ],
      ),
    );
  }
}