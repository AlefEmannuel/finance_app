import 'package:finance_app/app/shared/repositories/stock_repository.dart';
import 'package:finance_app/app/ui/home_page/home_controller.dart';
import 'package:finance_app/app/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  final StockRepository repository = StockRepository();
  final HomeController controller = HomeController(repository: repository);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Finance',
    home: HomePage(
      controller: controller,
    ),
  ));
}
