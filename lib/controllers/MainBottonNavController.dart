import 'package:clickandgoapp/pages/PaymentsPage.dart';
import 'package:clickandgoapp/pages/ScanPage.dart';
import 'package:clickandgoapp/pages/ShoppingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Main.dart';


class HomeBottomNavigationController extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeBottomNavigationControllerState();
  }
}

class HomeBottomNavigationControllerState extends State<HomeBottomNavigationController> {
  final List<Widget> pages = [
    ScanPage(),
    ShoppingPage(),
    PaymentsPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();


  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          Provider.of<AppState>(context, listen: false).changeBottomPage(index);
        },
        currentIndex: appState.currentPage,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.crop_free), title: Text('Сканировать')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text('Корзина')),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), title: Text('Оплата')),
        ],
      ),
      body: PageStorage(
        bucket: bucket,
        child: pages[appState.currentPage],
      ),
    );
  }
}
