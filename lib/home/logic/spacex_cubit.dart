import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/spacex_launch.dart';
import '../data/repo/api.dart';

abstract class SpaceXState {}

class SpaceXIntial extends SpaceXState {}

class SpaceXLoading extends SpaceXState {}

class SpaceXLoaded extends SpaceXState {
  final List<SpaceXLaunch> launches;
  SpaceXLoaded({required this.launches});
}

class SpaceXError extends SpaceXState {}

class SpaceXCubit extends Cubit<SpaceXState> {
  final SpaceXService spacexService;
  SpaceXCubit({required this.spacexService}) : super(SpaceXIntial());

  void fetchAllLaunches() async {
    emit(SpaceXLoading());
    try {
      final launches = await spacexService.fetchAllLaunches();
      emit(SpaceXLoaded(launches: launches));
    } catch (e) {
      emit(SpaceXError());
    }
  }
}
