part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoading extends MainState {
  const MainLoading();

  @override
  List<Object> get props => [];
}

class MainError extends MainState {
  const MainError();

  @override
  List<Object> get props => [];
}

class MainLoaded extends MainState {
  const MainLoaded({required this.companies, required this.chosenCompany});

  final List<Company> companies;
  final Company? chosenCompany;

  MainLoaded copyWith({List<Company>? companies,
      Company? chosenCompany}) =>
      MainLoaded(companies: companies ?? this.companies,
          chosenCompany: chosenCompany ?? this.chosenCompany);

  @override
  List<Object?> get props => [companies, chosenCompany];
}
