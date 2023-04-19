import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pie_chart/model.dart';
import 'package:pie_chart/repository.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<InitializeCompanies>(_onInitializeCompanies);
    on<ChooseCompany>(_onChooseCompany);
  }

  void _onInitializeCompanies(InitializeCompanies event, emit) async {
    emit(const MainLoading());
    try {
      List<Company> companies = await getCompanies();
      MainLoaded newState =
          MainLoaded(companies: companies, chosenCompany: null);
      emit(newState);
    } catch (e) {
      print(e);
      emit(const MainError());
    }
  }

  void _onChooseCompany(ChooseCompany event, emit) {
    if (state is MainLoaded) {
      MainLoaded newState =
          (state as MainLoaded).copyWith(chosenCompany: event.company);
      emit(newState);
    }
  }
}
