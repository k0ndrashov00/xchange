import 'package:flutter/material.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/bloc/cryptocurrencys_list_screen_bloc.dart';
import 'package:xchange/front/screens/cryptocurrency_screen.dart';
import 'package:xchange/front/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptocurrencysListScreen extends StatefulWidget {
  const CryptocurrencysListScreen({super.key});

  @override
  State<CryptocurrencysListScreen> createState() => _CryptocurrencysListScreenState();
}

class _CryptocurrencysListScreenState extends State<CryptocurrencysListScreen> {
  final cryptocurrencysListScreenBlocInstance = CryptocurrencysListScreenBloc();

  @override
  void initState() {
    cryptocurrencysListScreenBlocInstance.add(LoadCryptocurrencysList());
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh_rounded,
              size: MediaQuery.of(context).size.width * RefreshIconSize,
              color: RefreshIconColor,
            ),
            onPressed: () {
              cryptocurrencysListScreenBlocInstance.add(LoadCryptocurrencysList());
            }
          )
        ]
      ),
      backgroundColor: backgroundColor,
      body: BlocBuilder<CryptocurrencysListScreenBloc, CryptocurrencysListScreenState>(
        bloc: cryptocurrencysListScreenBlocInstance,
        builder: (context, state) {
          if (state is CryptocurrencysListLoaded) {
            return ListView.separated(
              itemCount: state.cryptocurrencysList.length,
              separatorBuilder: (context, index) => Divider(color: separatorColor),
              itemBuilder: (context, index) {
                final cryptocurrencyAllInfo = state.cryptocurrencysList[index];
                final cryptocurrencyImageUrl = cryptocurrencyAllInfo.fullCryptocurrencyImageUrl;
                final cryptocurrecyName = cryptocurrencyAllInfo.cryptocurrencyName;
                final cryptocurrencyPrice = cryptocurrencyAllInfo.cryptocurrencyPrice;
                return ListTile(
                  leading: Image.network(
                    width: MediaQuery.of(context).size.width * firstImageSize,
                    height: MediaQuery.of(context).size.width * firstImageSize,
                    cryptocurrencyImageUrl
                  ),
                  title: Text(
                    cryptocurrecyName,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * secondTextSize,
                      fontWeight: fontWeight,
                      color: firstTextColor
                    ),
                  ),
                  subtitle: Text(
                    cryptocurrencyPrice.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * thirdTextSize,
                      fontWeight: fontWeight,
                      color: secondTextColor
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: MediaQuery.of(context).size.width * arrowForwardAndBackIconSize,
                      color: arrowForwardAndBackIconColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CryptocurrencyScreen(cryptocurrencyName: cryptocurrecyName)
                        ),
                      );
                    }
                  )
                );
              }
            );
          }
          if (state is CryptocurrencysListLoadingFailure) {
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
                    onPressed: () {cryptocurrencysListScreenBlocInstance.add(LoadCryptocurrencysList());},
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
        },
      ),
    );
  }
}