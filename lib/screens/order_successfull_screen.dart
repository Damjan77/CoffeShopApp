// ignore_for_file: prefer_const_constructors
import 'package:coffe_shop_app/custom/custom_app_bar.dart';
import 'package:coffe_shop_app/model/Coffee.dart';
import 'package:coffe_shop_app/model/Map_model.dart';
import 'package:coffe_shop_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OrderSuccessfullScreen extends StatelessWidget {
  static const String idScreen = "orderSuccessfullScreen";

  const OrderSuccessfullScreen({super.key, required this.shop});

  final MapModel shop;

  @override
  Widget build(BuildContext context) {
    final dynamic order = ModalRoute.of(context)!.settings.arguments as Coffee;

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        widgets: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 30.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 30.0,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your order is: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.brown),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: const Color(0xFFFFEFC7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                order.image,
                                height: 80,
                              ),
                              Container(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(order.name,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Milk: ${order.milk ? "yes" : "no"}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Sugar: ${order.sugar}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "It is waiting for you at: ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.brown),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: const Color(0xFFFFEFC7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.cottage,
                                color: Colors.brown,
                                size: 32,
                              ),
                              Container(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(shop.name,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Location: " + shop.vicinity,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Have a nice coffee!",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.brown),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
