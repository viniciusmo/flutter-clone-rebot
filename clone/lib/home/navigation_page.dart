import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rebot/home/home_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF0077E77),
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
        Image.asset(
          'assets/ic_logo_atomic.png',
          height: 24,
          width: 105,
        ),
        Image.asset(
          'assets/ic_notification.png',
          height: 24,
          width: 24,
        ),
      ])),
      body: PageStorage(
        child: HomePage(),
        bucket: PageStorageBucket(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentTab = index;
            });
          },
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          // his will be set when a new tab is tapped
          items: [
            _buildBottomNavigationBarItem(
                "assets/ic_home.png", currentTab == 0, "Início"),
            _buildBottomNavigationBarItem(
                "assets/ic_orders.png", currentTab == 1, "Pedidos"),
            _buildBottomNavigationBarItem(
                "assets/ic_cart.png", currentTab == 2, "Carrinho"),
            _buildBottomNavigationBarItem(
                "assets/ic_wallet.png", currentTab == 3, "Gestão"),
            _buildBottomNavigationBarItem(
                "assets/ic_account.png", currentTab == 4, "Perfil")
          ]),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String image, isSelected, String label) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(image),
        color: isSelected ? Color(0xff007e78) : Color(0xff7c7c7c),
      ),
      title: new Text(label,
          style: TextStyle(
              fontSize: 14,
              color: isSelected ? Color(0xff007e78) : Color(0xff7c7c7c))),
    );
  }
}
