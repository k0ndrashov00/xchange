import 'dart:async';

import 'package:xchange/back/cryptocurrency_screen_back/second_api_requets.dart';
import 'package:xchange/back/cryptocurrency_screen_back/second_cryptocurrency_model.dart';
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
        final cryptocurrencyData = await SecondApiRequets(cryptocurrencyName: event.cryptocurrencyName).secondApiRequest().timeout(
          Duration(seconds: 5),
          onTimeout: () {
            throw TimeoutException;
          }
        );
        emit(CryptocurrencyDataLoaded(cryptocurrencyData: cryptocurrencyData));
      } catch (e) {
        emit(CryptocurrencyDataLoadingFailure());
      } finally {
        event.completer?.complete();
      }
    });
  }
}