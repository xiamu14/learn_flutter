import 'package:flutter_100_day/countries_client.dart';

void main() {
  final countriesReq = GQueryCountriesReq();

  final client = initClient('https://countries.trevorblades.com/');

  client.request(countriesReq).listen((event) {
    final results = event.data?.countries;
    if (results == null) throw Exception();
    if (results.isNotEmpty) {
      results.forEach((p0) {
        print('''
  ${p0.code} - ${p0.name} - ${p0.emoji}
''');
      });
    }
  });
}
