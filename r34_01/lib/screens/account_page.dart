import 'package:flutter/material.dart';
import 'package:r34_01/widgets/account_page/drawer_with_icon.dart';

class AccountPage extends StatelessWidget {
  final String accountName;
  final String email;
  const AccountPage({
    super.key,
    required this.accountName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person, size: 50),
        title: Column(
          children: [
            Text(
              accountName,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),

      body: Stack(
        children: [
          ListView(
            children: [
              DrawerWithIcon(
                label: "Orders",
                icon: Icons.shopping_bag_outlined,
              ),
              DrawerWithIcon(label: "My Details", icon: Icons.article_outlined),
              DrawerWithIcon(
                label: "Delivery Address",
                icon: Icons.location_on_outlined,
              ),
              DrawerWithIcon(
                label: "Payment Methods",
                icon: Icons.credit_card_outlined,
              ),
              DrawerWithIcon(
                label: "Promo Code",
                icon: Icons.local_offer_outlined,
              ),
              DrawerWithIcon(
                label: "Notification",
                icon: Icons.notifications_outlined,
              ),
              DrawerWithIcon(label: "Help", icon: Icons.help_outline),
              DrawerWithIcon(label: "About", icon: Icons.info_outline),
            ],
          ),
          Positioned(
            top: 560,
            right: 30,
            left: 30,
            child: Container(
              height: 70,
              padding: EdgeInsets.all(9),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xffE9E9E9)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_outlined, color: Colors.green, size: 23),
                    Text(
                      " Log Out",
                      style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
