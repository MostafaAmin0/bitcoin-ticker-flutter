import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  CurrencyWidget({
    @required this.fromCurrency,
    @required this.rate,
    @required this.dropDownValue,
  });

  final String fromCurrency;
  final String rate;
  final String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $fromCurrency = $rate $dropDownValue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
