import 'dart:developer';

import 'package:bloc_challenge/data/info_model.dart';
import 'package:bloc_challenge/data/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'intoxianime_event.dart';
import 'intoxianime_state.dart';

class IntoxiAnimeBloc extends Bloc<IntoxiAnimeEvent, IntoxianimeState> {
  Repository repository = DioRepository();
  IntoxiAnimeBloc() : super(IntoxianimeState());
  List<InfoModel> _listAnimes = [];

  @override
  Stream<IntoxianimeState> mapEventToState(IntoxiAnimeEvent event) async* {
    if (event is FetchAnimes) {
      try {
        _listAnimes.addAll(await repository.fetchData(page: state.page + 1));
        yield state.copyWith(
            status: InfoState.success,
            animes: _listAnimes,
            page: state.page + 1);
      } catch (e, stackTrace) {
        log('ops $e $stackTrace');
        yield state.copyWith(status: InfoState.failure, animes: []);
      }
    }
  }
}
