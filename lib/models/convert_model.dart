
class Currency {
  double amount;
  double oldamount;
  String new_currency;
  String old_currency;

  Currency({
    required this.amount,
    required this.oldamount,
    required this.new_currency,
    required this.old_currency,
  });

  factory Currency.fromMap(Map data) {
    return Currency(
      amount: data["new_amount"],
      oldamount: data["old_amount"],
      new_currency: data["new_currency"],
      old_currency: data["old_currency"],
    );
  }
}
