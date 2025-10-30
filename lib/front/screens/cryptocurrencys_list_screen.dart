import 'package:flutter/material.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/bloc/cryptocurrencys_list_screen_bloc.dart';
import 'package:xchange/front/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xchange/front/widgets/appbar/appbar_without_refresh_icon_widget.dart';
import 'package:xchange/front/widgets/appbar/cryptocurrencys_list_appbar_with_refresh_icon_widget.dart';
import 'package:xchange/front/widgets/body/circular_progress_indicator_widget.dart';
import 'package:xchange/front/widgets/body/cryptocurrencys_list_loading_failure_widget.dart';
import 'package:xchange/front/widgets/body/cryptocurrencys_list_widget.dart';

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
    return BlocBuilder<CryptocurrencysListScreenBloc, CryptocurrencysListScreenState>(
      bloc: cryptocurrencysListScreenBlocInstance,
      builder: (context, state) {
        if (state is CryptocurrencysListLoaded) {
          return Scaffold(
            appBar: CryptocurrencysListAppbarWithRefreshIconWidget(cryptocurrencysListScreenBlocInstance: cryptocurrencysListScreenBlocInstance),
            backgroundColor: backgroundColor,
            body: CryptocurrencysListWidget(state: state)
          );
        }
        if (state is CryptocurrencysListLoadingFailure) {
          return Scaffold(
            appBar: AppbarWithoutRefreshIconWidget(),
            backgroundColor: backgroundColor,
            body: CryptocurrencysListLoadingFailureWidget(cryptocurrencysListScreenBlocInstance: cryptocurrencysListScreenBlocInstance),
          );
        }
        return Scaffold(
          appBar: AppbarWithoutRefreshIconWidget(),
          backgroundColor: backgroundColor,
          body: CircularProgressIndicatorWidget()
        );
      },
    );
  }
}