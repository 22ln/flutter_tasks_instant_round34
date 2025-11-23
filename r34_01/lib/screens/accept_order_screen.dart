import 'package:flutter/material.dart';
import 'package:r34_01/widgets/entrypoint_ui.dart';

class AcceptOrderScreen extends StatelessWidget {
  const AcceptOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset(
                "assets/images/accepted.png",
                height: 200,
                width: 220,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Your Order has been accepted",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              "Your items has been placcd and is on it’s way to being processed",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 80),

            Container(
              height: 70,
              width: 314,
              padding: EdgeInsets.all(9),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
                child: Text(
                  "Track Order",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EntryPointUi()),
                );
              },
              child: Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
