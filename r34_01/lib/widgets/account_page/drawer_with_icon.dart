import 'package:flutter/material.dart';
import 'package:r34_01/widgets/home_page/drawer.dart';

class DrawerWithIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  const DrawerWithIcon({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 9, right: 5),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon),
              Expanded(
                child: DrawerList(label: label, onPressed: () {}),
              ),
            ],
          ),
          Divider(height: 1, thickness: 0.3, color: Colors.grey),
        ],
      ),
    );
  }
}
