import 'dart:async';

import 'package:xchange/back/cryptocurrencys_list_screen_back/first_api_request.dart';
import 'package:xchange/back/cryptocurrencys_list_screen_back/first_cryptocurrency_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cryptocurrencys_list_screen_event.dart';
part 'cryptocurrencys_list_screen_state.dart';

class CryptocurrencysListScreenBloc extends Bloc<CryptocurrencysListScreenEvent, CryptocurrencysListScreenState> {
  CryptocurrencysListScreenBloc() : super(CryptocurrencysListInitial()) {
    on<LoadCryptocurrencysList>((event, emit) async {
      try {
        if (state is! CryptocurrencysListLoaded) {
          emit(CryptocurrencysListLoading());
        }
        final cryptocurrencysList = await FirstApiRequest().firstApiRequest().timeout(
          Duration(seconds: 5),
          onTimeout: () {
            throw TimeoutException;
          }
        );
        emit(CryptocurrencysListLoaded(cryptocurrencysList: cryptocurrencysList));
      } catch (e) {
        emit(CryptocurrencysListLoadingFailure());
      } finally {
        event.completer?.complete();
      }
    });
  }
}