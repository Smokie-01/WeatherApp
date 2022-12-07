//https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=62CB2850-6B57-48ED-867F-3CDD1E198A85
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  Future<dynamic> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    final queryParameter = {
      "apikey": "62CB2850-6B57-48ED-867F-3CDD1E198A85",
    };
    for (String crypto in cryptoList) {
      var uri = Uri.https('rest.coinapi.io',
          'v1/exchangerate/$crypto/$selectedCurrency', queryParameter);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        var coinData = jsonDecode(response.body);
        double price = coinData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'problem with get request';
      }
    }
    return cryptoPrices;
  }
}
