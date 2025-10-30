import 'package:flutter/material.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/cryptocurrency_model_for_cryptocurrencys_list_screen.dart';
import 'package:xchange/front/screens/cryptocurrency_screen.dart';
import 'package:xchange/front/theme.dart';

class CryptocurrencyWidget extends StatelessWidget {
  final CryptocurrencyScreen widget;
  final dynamic state;
  final List<CryptocurrencyModelForCryptocurrencysListScreen> cryptocurrencysList;

  const CryptocurrencyWidget({
    super.key,
    required this.widget,
    required this.state,
    required this.cryptocurrencysList
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
            height: MediaQuery.of(context).size.width * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.cryptocurrencysList.length,
              itemBuilder: (context, index) {
                final cryptocurrencyImageUrl = widget.cryptocurrencysList[index].fullCryptocurrencyImageUrl;
                bool isSelected = cryptocurrencyImageUrl == state.cryptocurrencyData.fullCryptocurrencyImageUrl;
                return GestureDetector(
                  onTap: () {
                    final selectedCryptocurrencyName = widget.cryptocurrencysList[index].cryptocurrencyName;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CryptocurrencyScreen(cryptocurrencyName: selectedCryptocurrencyName, cryptocurrencysList: widget.cryptocurrencysList)
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.width * 0.35,
                    margin: index < widget.cryptocurrencysList.length - 1 ? EdgeInsets.only(right: 10) : EdgeInsets.zero,   
                    decoration: BoxDecoration(
                      color: cryptocurrencyInfoBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: isSelected ? Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ) : null,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            height: MediaQuery.of(context).size.width * 0.25,
                            cryptocurrencyImageUrl
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Click to go',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * fourthTextSize,
                              fontWeight: fontWeight,
                              color: firstTextColor,
                            )
                          )
                        ],
                      ),
                    )
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}