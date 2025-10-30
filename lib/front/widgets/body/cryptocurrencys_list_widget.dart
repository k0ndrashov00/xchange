import 'package:flutter/material.dart';
import 'package:xchange/front/screens/cryptocurrency_screen.dart';
import 'package:xchange/front/theme.dart';

class CryptocurrencysListWidget extends StatelessWidget {
  final dynamic state;

  const CryptocurrencysListWidget({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
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
              size: MediaQuery.of(context).size.width * arrowForwardIconSize,
              color: arrowForwardIconColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CryptocurrencyScreen(cryptocurrencyName: cryptocurrecyName, cryptocurrencysList: state.cryptocurrencysList)
                ),
              );
            }
          )
        );
      }
    );
  }
}