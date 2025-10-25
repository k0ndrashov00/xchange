import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xchange/back/cryptocurrency_screen_back/bloc/cryptocurrency_screen_bloc.dart';
import 'package:xchange/front/theme.dart';

class CryptocurrencyScreen extends StatefulWidget {
  final String cryptocurrencyName;

  const CryptocurrencyScreen({
    super.key,
    required this.cryptocurrencyName
  });

  @override
  State<CryptocurrencyScreen> createState() => _CryptocurrencyScreenState();
}

class _CryptocurrencyScreenState extends State<CryptocurrencyScreen> {
  final cryptocurrencyScreenBlocInstance = CryptocurrencyScreenBloc();

  @override
  void initState() {
    cryptocurrencyScreenBlocInstance.add(LoadCryptocurrencyData(cryptocurrencyName: widget.cryptocurrencyName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Xchange',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * firstTextSize,
            fontWeight: fontWeight,
            color: firstTextColor
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: MediaQuery.of(context).size.width * arrowForwardAndBackSize,
            color: arrowForwardAndBackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          }
        )
      ),
      backgroundColor: backgroundColor,
      body: BlocBuilder<CryptocurrencyScreenBloc, CryptocurrencyScreenState>(
        bloc: cryptocurrencyScreenBlocInstance,
        builder: (context, state) {
          if (state is CryptocurrencyDataLoaded) {
            return RefreshIndicator(
              backgroundColor: backgroundRefreshIndicatorColor,
              color: refreshIndicatorColor,
              onRefresh: () async {
                final completer = Completer();
                cryptocurrencyScreenBlocInstance.add(LoadCryptocurrencyData(cryptocurrencyName: widget.cryptocurrencyName, completer: completer));
                return completer.future;
              },
              child: Placeholder() //TODO
            );
          }
          if (state is CryptocurrencyDataLoadingFailure) {
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
                    style: ElevatedButton.styleFrom(backgroundColor: buttonBackgroundColor),
                    child: Text(
                      'Try again now', 
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * secondTextSize,
                        fontWeight: fontWeight,
                        color: firstTextColor
                      )
                    ),
                    onPressed: () {cryptocurrencyScreenBlocInstance.add(LoadCryptocurrencyData(cryptocurrencyName: widget.cryptocurrencyName));},
                  )
                ],
              ),
            );
          }
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * circularProgressIndicatorSize,
              height: MediaQuery.of(context).size.width * circularProgressIndicatorSize,
              child: CircularProgressIndicator(color: circularProgressIndicatorColor),
            ),
          );
        }
      )
    );
  }
}