// To parse this JSON data, do
//
//     final currencyRates = currencyRatesFromJson(jsonString);

import 'dart:convert';

CurrencyRates currencyRatesFromJson(String str) =>
    CurrencyRates.fromJson(json.decode(str));

String currencyRatesToJson(CurrencyRates data) => json.encode(data.toJson());

class CurrencyRates {
  CurrencyRates({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  factory CurrencyRates.fromJson(Map<String, dynamic> json) => CurrencyRates(
        disclaimer: json["disclaimer"],
        license: json["license"],
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
