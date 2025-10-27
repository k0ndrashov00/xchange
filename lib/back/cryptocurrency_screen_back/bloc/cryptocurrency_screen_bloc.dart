import 'dart:async';

import 'package:xchange/back/cryptocurrency_screen_back/api_requets_for_cryptocurrency_screen.dart';
import 'package:xchange/back/cryptocurrency_screen_back/cryptocurrency_model_for_cryptocurrency_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cryptocurrency_screen_event.dart';
part 'cryptocurrency_screen_state.dart';

class CryptocurrencyScreenBloc extends Bloc<CryptocurrencyScreenEvent, CryptocurrencyScreenState> {
  CryptocurrencyScreenBloc() : super(CryptocurrencyDataInitial()) {
    on<LoadCryptocurrencyData>((event, emit) async {
      try {
        if (state is! CryptocurrencyDataLoaded) {
          emit(CryptocurrencyDataLoading());
        }
        final cryptocurrencyData = await ApiRequetsForCryptocurrencyScreen(cryptocurrencyName: event.cryptocurrencyName).apiRequetsForCryptocurrencyScreen().timeout(
          Duration(seconds: 5),
          onTimeout: () {
            throw TimeoutException;
          }
        );
        emit(CryptocurrencyDataLoaded(cryptocurrencyData: cryptocurrencyData));
      } catch (e) {
        emit(CryptocurrencyDataLoadingFailure());
      }
    });
  }
}