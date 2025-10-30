import 'package:flutter/material.dart';
import 'package:xchange/front/screens/cryptocurrency_screen.dart';
import 'package:xchange/front/theme.dart';

class CryptocurrencyWidget extends StatelessWidget {
  final CryptocurrencyScreen widget;
  final dynamic state;

  const CryptocurrencyWidget({
    super.key,
    required this.widget,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
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
}