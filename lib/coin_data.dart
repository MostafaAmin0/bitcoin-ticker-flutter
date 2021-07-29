import 'package:bitcoin_ticker/network.dart';
import 'package:flutter/material.dart';

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
  final _url = 'https://rest.coinapi.io/v1/exchangerate';
  final _apiKey = 'A35536F8-C883-4242-8939-9375029A41DD';

  Future getRate(@required String to) async {
    NetworkHelper networkHelper;
    Map<String, dynamic> rateMap = {};
    for (String crypt in cryptoList) {
      networkHelper = NetworkHelper('$_url/$crypt/$to?apikey=$_apiKey');
      var rate = await networkHelper.getData();
      rateMap.putIfAbsent(crypt, () => rate);
    }
    return rateMap;
  }
}
