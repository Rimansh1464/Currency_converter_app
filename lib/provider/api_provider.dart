

import 'package:flutter/cupertino.dart';
import '../models/convert_model.dart';
import 'api_helper.dart';

class CurrencyProvider extends ChangeNotifier{

  Currency? amounts ;

  void convertCurrencies ({required String want, required String have, required String amount}) async {

    amounts = await CurrencyHelper.currencyHelper.convertCurrency(want: want, have: have, amount: amount);
    notifyListeners();
  }


}