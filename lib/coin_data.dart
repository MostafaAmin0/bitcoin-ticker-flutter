import 'package:bitcoin_ticker/network.dart';

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

  final _url='https://rest.coinapi.io/v1/exchangerate/BTC';
  final _apiKey='A35536F8-C883-4242-8939-9375029A41DD';

  Future getRate(String second)async{
    NetworkHelper networkHelper= NetworkHelper('${_url}/${second}?apikey=$_apiKey');  
    return await networkHelper.getData();
  }

}
