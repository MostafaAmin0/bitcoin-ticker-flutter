import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import '../components/currencyWidget.dart';
//import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropDownValue = currenciesList[0];
  CoinData coinData = CoinData();
  List<String> rate = ['?', '?', '?'];

  void updateUI() async {
    try {
      var data = await coinData.getRate(dropDownValue);
      setState(() {
        for (int i = 0; i < rate.length; i++)
          rate[i] = data[cryptoList[i]]['rate'].toStringAsFixed(1);
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

  Column makeCards() {
    List<CurrencyWidget> cryptoCards = [];
    for (int i=0;i<cryptoList.length;i++) {
      cryptoCards.add(
        CurrencyWidget(
          fromCurrency: cryptoList[i],
          rate: rate[i],
          dropDownValue: dropDownValue,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
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
          makeCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            //child: Platform.isIOS ? iosPicker() : androidDropDown() ,
            child: androidDropDown(),
          ),
        ],
      ),
    );
  }
}
