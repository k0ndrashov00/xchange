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
            size: MediaQuery.of(context).size.width * arrowForwardAndBackIconSize,
            color: arrowForwardAndBackIconColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh_rounded,
              size: MediaQuery.of(context).size.width * refreshIconSize,
              color: refreshIconColor,
            ),
            onPressed: () {
              cryptocurrencyScreenBlocInstance.add(LoadCryptocurrencyData(cryptocurrencyName: widget.cryptocurrencyName));
            }
          )
        ]
      ),
      backgroundColor: backgroundColor,
      body: BlocBuilder<CryptocurrencyScreenBloc, CryptocurrencyScreenState>(
        bloc: cryptocurrencyScreenBlocInstance,
        builder: (context, state) {
          if (state is CryptocurrencyDataLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    width: MediaQuery.of(context).size.width * secondImageSize,
                    height: MediaQuery.of(context).size.width * secondImageSize,
                    state.cryptocurrencyData.fullCryptocurrencyImageUrl
                  ),
                  if(widget.cryptocurrencyName == 'ETH')
                    SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      color: cryptocurrencyInfoBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name:',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * secondTextSize,
                                  fontWeight: fontWeight,
                                  color: firstTextColor,
                                ),
                              ),
                              Text(
                                widget.cryptocurrencyName,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * secondTextSize,
                                  fontWeight: fontWeight,
                                  color: firstTextColor,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price:',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * secondTextSize,
                                  fontWeight: fontWeight,
                                  color: firstTextColor,
                                ),
                              ),
                              Text(
                                state.cryptocurrencyData.cryptocurrencyPrice.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * secondTextSize,
                                  fontWeight: fontWeight,
                                  color: firstTextColor,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Max in 24 hour:',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * secondTextSize,
                                  fontWeight: fontWeight,
                                  color: firstTextColor,
                                ),
                              ),
                              Text(
                                state.cryptocurrencyData.cryptocurrencyHigh24Hour.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * secondTextSize,
                                  fontWeight: fontWeight,
                                  color: firstTextColor,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Low in 24 hour:',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * secondTextSize,
                                  fontWeight: fontWeight,
                                  color: firstTextColor,
                                ),
                              ),
                              Text(
                                state.cryptocurrencyData.cryptocurrencyLow24Hour.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * secondTextSize,
                                  fontWeight: fontWeight,
                                  color: firstTextColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/photo.jpg',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  )
                ],
              ),
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
                    style: ElevatedButton.styleFrom(backgroundColor: tryAgainButtonBackgroundColor),
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