import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism/models/data_model.dart';
import 'package:tourism/services/data_services.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;

  late final places;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
