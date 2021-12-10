// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$searchAtom = Atom(name: '_HomeControllerBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$stocksAtom = Atom(name: '_HomeControllerBase.stocks');

  @override
  ObservableList<Stock> get stocks {
    _$stocksAtom.reportRead();
    return super.stocks;
  }

  @override
  set stocks(ObservableList<Stock> value) {
    _$stocksAtom.reportWrite(value, super.stocks, () {
      super.stocks = value;
    });
  }

  @override
  String toString() {
    return '''
search: ${search},
stocks: ${stocks}
    ''';
  }
}
