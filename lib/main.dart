import 'package:flutter/material.dart';
import 'package:xchange/front/screens/cryptocurrencys_list_screen.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => CryptocurrencysListScreen(),
    },
  ));
}

//flutter pub run build_runner build --delete-conflicting-outputs