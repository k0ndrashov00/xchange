import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xchange/back/cryptocurrency_screen_back/bloc/cryptocurrency_screen_bloc.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/cryptocurrency_model_for_cryptocurrencys_list_screen.dart';
import 'package:xchange/front/theme.dart';
import 'package:xchange/front/widgets/appbar/appbar_without_refresh_icon_widget.dart';
import 'package:xchange/front/widgets/appbar/cryptocurrency_appbar_with_refresh_icon_widget.dart';
import 'package:xchange/front/widgets/body/circular_progress_indicator_widget.dart';
import 'package:xchange/front/widgets/body/cryptocurrency_loading_failure_widget.dart';
import 'package:xchange/front/widgets/body/cryptocurrency_widget.dart';

class CryptocurrencyScreen extends StatefulWidget {
  final String cryptocurrencyName;
  final List<CryptocurrencyModelForCryptocurrencysListScreen> cryptocurrencysList;

  const CryptocurrencyScreen({
    super.key,
    required this.cryptocurrencyName,
    required this.cryptocurrencysList
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
    return BlocBuilder<CryptocurrencyScreenBloc, CryptocurrencyScreenState>(
      bloc: cryptocurrencyScreenBlocInstance,
      builder: (context, state) {
        if (state is CryptocurrencyDataLoaded) {
          return Scaffold(
            appBar: CryptocurrencyAppbarWithRefreshIconWidget(cryptocurrencyScreenBlocInstance: cryptocurrencyScreenBlocInstance, widget: widget),
            backgroundColor: backgroundColor,
            body: CryptocurrencyWidget(widget: widget, state: state, cryptocurrencysList: widget.cryptocurrencysList,)
          );
        }
        if (state is CryptocurrencyDataLoadingFailure) {
          return Scaffold(
            appBar: AppbarWithoutRefreshIconWidget(),
            backgroundColor: backgroundColor,
            body: CryptocurrencyLoadingFailureWidget(cryptocurrencyScreenBlocInstance: cryptocurrencyScreenBlocInstance, cryptocurrecyName: widget.cryptocurrencyName),
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