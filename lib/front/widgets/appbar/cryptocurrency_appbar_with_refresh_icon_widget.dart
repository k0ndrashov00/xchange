import 'package:flutter/material.dart';
import 'package:xchange/back/cryptocurrency_screen_back/bloc/cryptocurrency_screen_bloc.dart';
import 'package:xchange/front/screens/cryptocurrency_screen.dart';
import 'package:xchange/front/theme.dart';

class CryptocurrencyAppbarWithRefreshIconWidget extends StatelessWidget implements PreferredSizeWidget {
  final CryptocurrencyScreenBloc cryptocurrencyScreenBlocInstance;
  final CryptocurrencyScreen widget;

  const CryptocurrencyAppbarWithRefreshIconWidget({
    super.key,
    required this.cryptocurrencyScreenBlocInstance,
    required this.widget,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}