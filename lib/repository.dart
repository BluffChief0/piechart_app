import 'dart:convert';

import 'package:http/http.dart';
import 'package:pie_chart/model.dart';

Future<List<Company>> getCompanies() async {
  List<String> companies = ['AAPL', 'AMZN', 'META', 'MSFT', 'IBM'];
  List<Company> coms = [];
  for (String str in companies) {
    Response resp = await get(Uri.parse(
        'https://www.alphavantage.co/query?function=OVERVIEW&symbol=$str&apikey=D69V8EZO38KM08KV'));
    Map<String, dynamic> data = jsonDecode(resp.body);
    coms.add(Company.fromJson(data));
  }
  return coms;
}
