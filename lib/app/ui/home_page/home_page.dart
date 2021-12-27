import 'package:finance_app/app/shared/models/stock.dart';
import 'package:finance_app/app/theme/app_theme.dart';
import 'package:finance_app/app/theme/text_style_theme.dart';
import 'package:finance_app/app/ui/components/stock_card.dart';
import 'package:finance_app/app/ui/home_page/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final myController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          title: Text("Finance"),
          backgroundColor: AppTheme.dark2,
          centerTitle: true,
          elevation: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var stock = await widget.controller.getStockByCode();
          if (stock == null) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Está ação não existe'), backgroundColor: Colors.red,));
          }
        },
        backgroundColor: AppTheme.dark3,
        child: const Icon(Icons.add),
      ),
      body: Container(
        width: width,
        height: height,
        color: AppTheme.dark2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                  child: TextField(
                    controller: myController,
                    style: TextStyleTheme.title3,
                    decoration: InputDecoration(
                        labelStyle: TextStyleTheme.title3,
                        hintStyle: TextStyleTheme.title3,
                        hintText: 'Pesquisar ação',
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppTheme.white,
                        )),
                    onChanged: (value) {
                      widget.controller.setSearch(value);
                    },
                  )),
              Container(
                color: AppTheme.dark2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: width * 0.9,
                      child: Observer(builder: (_) {
                        return ListView.builder(
                          itemCount: widget.controller.stocks.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            Stock stock = widget.controller.stocks[index];
                            return Column(
                              children: [
                                Dismissible(
                                  key: Key(stock.name),
                                  direction: DismissDirection.startToEnd,
                                  onDismissed: (direction) {
                                    // Remove the item from the data source.
                                    setState(() {
                                      widget.controller.stocks.removeAt(index);
                                    });

                                    // Then show a snackbar.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                '${stock.symbol} removido')));
                                  },
                                  background: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      alignment: Alignment.centerLeft,
                                      color: Colors.red,
                                      child: Icon(
                                        Icons.delete,
                                        color: AppTheme.white,
                                      )),
                                  child: StockCard(
                                      width: width,
                                      height: height,
                                      initials: stock.symbol,
                                      name: stock.name,
                                      price: "R\$ ${stock.price}",
                                      boxInitialColor: widget.controller
                                          .getColorCard(stock.price)),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
