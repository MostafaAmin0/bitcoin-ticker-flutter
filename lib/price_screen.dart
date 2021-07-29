import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import '../components/currencyWidget.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropDownValue = currenciesList[0];
  CoinData coinData = CoinData();
  String rate = '?';

  void updateUI() async {
    try {
      var data = await coinData.getRate(dropDownValue);
      setState(() {
        rate = data['rate'].toStringAsFixed(1);
        print(rate);
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (String currency in currenciesList) {
      menuItems.add(DropdownMenuItem(value: currency, child: Text(currency)));
    }

    return DropdownButton<String>(
      items: menuItems,
      value: dropDownValue,
      onChanged: (value) {
        setState(() {
          dropDownValue = value;
          updateUI();
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> menuItems = [];
    for (String currency in currenciesList) {
      menuItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 30.0,
      onSelectedItemChanged: (indexValue) {
        setState(() {
          dropDownValue = currenciesList[indexValue];
          updateUI();
        });
      },
      children: menuItems,
    );
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              CurrencyWidget(
                fromCurrency: cryptoList[0],
                rate: rate,
                dropDownValue: dropDownValue,
              ),
              CurrencyWidget(
                fromCurrency: cryptoList[1],
                rate: rate,
                dropDownValue: dropDownValue,
              ),
              CurrencyWidget(
                fromCurrency: cryptoList[2],
                rate: rate,
                dropDownValue: dropDownValue,
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidDropDown() ,
            //child: androidDropDown(),
          ),
        ],
      ),
    );
  }
}
