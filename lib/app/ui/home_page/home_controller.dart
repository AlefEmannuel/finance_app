import 'package:finance_app/app/shared/models/stock.dart';
import 'package:finance_app/app/shared/repositories/stock_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final StockRepository repository;

  _HomeControllerBase({required this.repository}) {
    stocks = ObservableList.of([]);
  }

  @observable
  String search = "";

  @observable
  bool loading = false;

  @observable
  bool repeatedStock = false;

  @observable
  ObservableList<Stock> stocks = ObservableList.of([]);

  void clearSearch() {
    setSearch("");
  }

  void setSearch(String text) {
    search = text;
    print(search);
  }

  Future<Stock?> getStockByCode() async {
    loading = true;
    Stock? stock = await repository.getStock(search.toUpperCase());
    loading = false;
    clearSearch();
    if (stock != null) {
      if (!searchRepeatedStock(stock)) {
        stocks.add(stock);
        return stock;
      }else{
        repeatedStock = true;
        return stock;
      }
    } else {
      return null;
    }
  }

  bool searchRepeatedStock(Stock stock) {
    for (var item in stocks) {
      if (item.symbol == stock.symbol) return true;
    }
    return false;
  }

  Color getColorCard(double price) {
    if (price < 10)
      return Colors.amber;
    else if (price >= 10 && price < 20)
      return Colors.green;
    else if (price >= 20 && price < 30)
      return Colors.blue;
    else
      return Colors.red;
  }
}
