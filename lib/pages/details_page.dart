import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/main_bloc/main_bloc.dart';
import 'package:pie_chart/model.dart';
import 'package:pie_chart/util.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Company company =
        (BlocProvider.of<MainBloc>(context).state as MainLoaded).chosenCompany!;
    return Scaffold(
      appBar: AppBar(
        title: Text(company.symbol),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Full name of company: ${company.name}',
                  style: textStyle,
                ),
                Text(
                  "Company's sector: ${company.sector}",
                  style: textStyle,
                ),
                Text(
                  "Country of location: ${company.country}",
                  style: textStyle,
                ),
                Text(
                  'Market capitalization: ${company.marketCapitalization} \$',
                  style: textStyle,
                ),
                Text(
                  company.description,
                  style: textStyle,
                )
              ]),
        ),
      ),
    );
  }
}
