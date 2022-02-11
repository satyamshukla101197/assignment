import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supdup/core/error/failures.dart';
import 'package:supdup/core/usecse/usecase.dart';
import 'package:supdup/core/utils/constants.dart';
import 'package:supdup/features/data/entities/entities.dart';
import 'package:supdup/features/data/use_cases/use_case.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final HomeScreenUseCase _homeScreenUseCase;
  HomeScreenBloc({
    required final HomeScreenUseCase homeScreenUseCase,
}) :assert(homeScreenUseCase !=null),
  _homeScreenUseCase=homeScreenUseCase,
        super(HomeScreenInitial());

  @override
  Stream<HomeScreenState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    if (event is HomeScreenEvent) {
      yield HomeScreenLoadingState();
      final data = await _homeScreenUseCase.call(NoParams());
      yield* data.fold((failure) async* {
        if (failure is CacheFailure) {
          yield HomeScreenErrorState(message: failure.message);
        } else if (failure is ServerFailure) {
          yield HomeScreenErrorState(message: failure.message);
        } else {
          yield HomeScreenErrorState(message: Constants.ERROR_UNKNOWN);
        }
      }, (loadedDataEntity) async* {
        yield HomeScreenLoadedState( userModelEntity: loadedDataEntity);
      });
    }
  }
}
