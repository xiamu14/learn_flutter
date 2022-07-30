import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app_ui/wigets/my_button.dart';
import 'package:wallet_app_ui/wigets/my_card.dart';
import 'package:wallet_app_ui/wigets/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink[500],
        child: const Icon(Icons.monetization_on, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 32,
                color: Colors.pink,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, size: 32),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'My',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' Cards',
                          style: TextStyle(
                            fontSize: 26.0,
                          ),
                        ),
                      ],
                    ),
                    // Plus Button
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 189, 189, 189),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
            //  cards
            SizedBox(
              height: 160,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 123235423,
                    expiryYear: 26,
                    expiryMonth: 10,
                    color: (Colors.deepOrange[300])!,
                  ),
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 123235423,
                    expiryYear: 26,
                    expiryMonth: 10,
                    color: (Colors.deepPurple[300])!,
                  ),
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 123235423,
                    expiryYear: 26,
                    expiryMonth: 10,
                    color: (Colors.blue[300])!,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //  3 buttons -> send + pay + bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  MyButton(
                    iconImagePath: 'assets/money.png',
                    buttonText: 'money',
                  ),
                  MyButton(
                    iconImagePath: 'assets/debit-card.png',
                    buttonText: 'Pay',
                  ),
                  MyButton(
                    iconImagePath: 'assets/bill.png',
                    buttonText: 'Bill',
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // column -> stats -> transactions
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: const [
                  MyListTile(
                    iconImagePath: 'assets/stats.png',
                    tileTitle: 'Statistics',
                    tileSubTitle: 'Payments and Income',
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
