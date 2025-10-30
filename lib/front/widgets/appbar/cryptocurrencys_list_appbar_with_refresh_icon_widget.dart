import 'package:flutter/material.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/bloc/cryptocurrencys_list_screen_bloc.dart';
import 'package:xchange/front/theme.dart';

class CryptocurrencysListAppbarWithRefreshIconWidget extends StatelessWidget implements PreferredSizeWidget {
  final CryptocurrencysListScreenBloc cryptocurrencysListScreenBlocInstance;

  const CryptocurrencysListAppbarWithRefreshIconWidget({
    super.key,
    required this.cryptocurrencysListScreenBlocInstance,
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
      actions: [
        IconButton(
          icon: Icon(
            Icons.refresh_rounded,
            size: MediaQuery.of(context).size.width * refreshAndHomeIconSize,
            color: refreshAndHomeIconColor,
          ),
          onPressed: () {
            cryptocurrencysListScreenBlocInstance.add(LoadCryptocurrencysList());
          }
        )
      ]
    );
  }
}