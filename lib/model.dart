import 'package:equatable/equatable.dart';

class Company extends Equatable {
  const Company({
    required this.symbol,
    required this.name,
    required this.description,
    required this.country,
    required this.sector,
    required this.marketCapitalization,
  });

  final String symbol;
  final String name;
  final String description;
  final String country;
  final String sector;
  final int marketCapitalization;

  factory Company.fromJson(Map<String, dynamic> json) =>
      Company(symbol: json['Symbol'],
          name: json['Name'],
          description: json['Description'],
          country: json['Country'],
          sector: json['Sector'],
          marketCapitalization: int.parse(json['MarketCapitalization']));

  @override
  List<Object?> get props =>
      [symbol, name, description, country, sector, marketCapitalization];
}
