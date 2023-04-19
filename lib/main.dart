import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/main_bloc/main_bloc.dart';
import 'package:pie_chart/pages/details_page.dart';
import 'package:pie_chart/pages/main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MainBloc mainBloc;

  @override
  void initState() {
    super.initState();
    mainBloc = MainBloc();
    mainBloc.add(const InitializeCompanies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainBloc,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const MainPage(),
          '/details': (context) => const DetailsPage()
        },
      ),
    );
  }
}
