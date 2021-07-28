import 'package:bloc_challenge/data/info_model.dart';
import 'package:equatable/equatable.dart';

enum InfoState { initial, success, failure }

class IntoxianimeState extends Equatable {
  const IntoxianimeState({
    this.status = InfoState.initial,
    this.animes = const <InfoModel>[],
    this.page = 0,
  });

  final InfoState status;
  final List<InfoModel> animes;
  final int page;

  IntoxianimeState copyWith({
    InfoState? status,
    List<InfoModel>? animes,
    int? page,
  }) {
    return IntoxianimeState(
      status: status ?? this.status,
      animes: animes ?? this.animes,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''IntoxianimeState { status: $status, page: $page, animes: ${animes.length} }''';
  }

  @override
  List<Object> get props => [status, animes, page];
}
