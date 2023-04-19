part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class InitializeCompanies extends MainEvent {
  const InitializeCompanies();

  @override
  List<Object> get props => [];
}

class ChooseCompany extends MainEvent {
  const ChooseCompany(this.company);
  final Company company;

  @override
  List<Object> get props => [company];
}
