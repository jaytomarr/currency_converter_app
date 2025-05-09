import 'package:open_exchange_app/components/anyToAny.dart';
import 'package:open_exchange_app/components/usdToAny.dart';
import 'package:open_exchange_app/functions/fetchrates.dart';
import 'package:open_exchange_app/models/currencyrates.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Initial Variables

  late Future<CurrencyRates> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  //Getting CurrencyRates and All Currencies
  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchrates();
      allcurrencies = fetchcurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Open Exchange',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),

        //Future Builder for Getting Exchange Rates
        body: Container(
          height: h,
          width: w,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: FutureBuilder<CurrencyRates>(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(
                    child: FutureBuilder<Map>(
                        future: allcurrencies,
                        builder: (context, currSnapshot) {
                          if (currSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              UsdToAny(
                                currencies: currSnapshot.data!,
                                rates: snapshot.data!.rates,
                              ),
                              AnyToAny(
                                currencies: currSnapshot.data!,
                                rates: snapshot.data!.rates,
                              ),
                            ],
                          );
                        }),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
