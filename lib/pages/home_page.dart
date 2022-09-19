// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_ui/util/my_button.dart';
import 'package:wallet_ui/util/my_card.dart';
import 'package:wallet_ui/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            //appBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  //plus button
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            //cards
            Container(
              height: 200,
              child: PageView(
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5730.20,
                    cardNumber: 19801970,
                    expiryMonth: 10,
                    expiryYear: 31,
                    color: Colors.deepPurple[300],
                  ),
                  MyCard(
                      balance: 55450.20,
                      cardNumber: 56520653,
                      expiryMonth: 10,
                      expiryYear: 26,
                      color: Colors.blue[300]),
                  MyCard(
                      balance: 1034.23,
                      cardNumber: 12436543,
                      expiryMonth: 12,
                      expiryYear: 31,
                      color: Colors.green[300]),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
            ),
            SizedBox(
              height: 25,
            ),
            //3 buttons -> send + pay +bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //send button
                  MyButton(
                      iconImagePath: 'lib/icon/send-money.png',
                      buttonText: 'Send'),
                  //pay button
                  MyButton(
                      iconImagePath: 'lib/icon/credit-card.png',
                      buttonText: 'Pay'),
                  //bills button
                  MyButton(
                    iconImagePath: 'lib/icon/bill.png',
                    buttonText: 'Bills',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            //column -> stats + transactions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  //stats
                  MyListTile(
                      iconImagePath: 'lib/icon/statistics.png',
                      tileName: 'Statistics',
                      tileSubName: 'Payment and Income'),
                  SizedBox(height: 35,),
                  //transactions
                  MyListTile(
                      iconImagePath: 'lib/icon/transaction.png',
                      tileName: 'Transactions',
                      tileSubName: 'Transaction history')
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 32,
                 color: Colors.pink[200],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 32,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.monetization_on_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
