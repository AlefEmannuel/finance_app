class Stock {
  String symbol;
  String name;
  String companyName;
  String document;
  String description;
  String website;
  String region;
  String currency;
  double marketCap;
  double price;
  double changePercent;
  String updatedAt;

  Stock(
      {this.symbol = "",
      this.name = "",
      this.companyName = "",
      this.document = "",
      this.description = "",
      this.website = "",
      this.region = "",
      this.currency = "",
      this.marketCap = 0,
      this.price = 0,
      this.changePercent = 0,
      this.updatedAt = ""});

  Stock.fromJson(Map<dynamic, dynamic> json)
      : symbol = json['symbol'],
        name = json['name'],
        companyName = json['company_name'],
        document = json['document'],
        description = json['description'],
        website = json['website'],
        region = json['region'],
        currency = json['currency'],
        marketCap = json['market_cap'],
        price = json['price'],
        changePercent = json['change_percent'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['document'] = this.document;
    data['description'] = this.description;
    data['website'] = this.website;
    data['region'] = this.region;
    data['currency'] = this.currency;
    data['market_cap'] = this.marketCap;
    data['price'] = this.price;
    data['change_percent'] = this.changePercent;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
