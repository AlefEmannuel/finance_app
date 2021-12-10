import 'package:finance_app/app/shared/models/stock.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StockRepository {
  StockRepository() {
    init();
  }

  void init() {
    getStock("PETR4");
  }

  static const url =
      "https://api.hgbrasil.com/finance/stock_price?key=7a615788";

  Future<Stock?> getStock(String code) async {
    var stockUrl = "$url&symbol=$code";
    var response = await http.get(Uri.parse(stockUrl));

    if (response.statusCode == 200) {
      var responseData = convert.jsonDecode(response.body);
      if (responseData is Map) {
        final Stock stock = Stock.fromJson(responseData['results'][code]);
        return stock;
      }
    } else {
      return null;
    }
  }
}
