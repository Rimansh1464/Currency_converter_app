import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/convert_model.dart';

class CurrencyHelper {
  CurrencyHelper._();

  static final CurrencyHelper currencyHelper = CurrencyHelper._();

  Future<Currency?> convertCurrency({required String want, required String have, required String amount}) async {
    http.Response response = await http.get(Uri.parse("https://api.api-ninjas.com/v1/convertcurrency?want=$want&have=$have&amount=$amount"), headers: {
      "X-API-Key": "+NFA9iEnVi2wqDLxMVHToA==iQ4HqxgkrDLVuM3w",
    });

    if (response.statusCode == 200) {

      Map<String, dynamic> data = await jsonDecode(response.body);
      Currency dataList = Currency.fromMap(data);


      return dataList;
    }
    return null;
  }
}
