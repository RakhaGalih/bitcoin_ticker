import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<double> getPrice(String currency, String crypto) async {
    var res = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=8836990B-57B8-45B7-A21C-97C668A50175'));
    if (res.statusCode == 200) {
      var usd = jsonDecode(res.body)['rate'];
      print(usd);
      return usd;
    } else {
      print('error');
      return 0;
    }
  }
}
