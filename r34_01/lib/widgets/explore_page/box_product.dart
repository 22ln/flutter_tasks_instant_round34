import 'package:flutter/material.dart';

class BoxProduct extends StatelessWidget {
  final String image1;
  final String boxName1;
  final String image2;
  final String boxName2;
  const BoxProduct({
    super.key,
    required this.image1,
    required this.boxName1,
    required this.image2,
    required this.boxName2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //box1
        Container(
          width: 185,
          height: 189,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green, width: 0.9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image1, width: 115, fit: BoxFit.fill),
              SizedBox(height: 10,),

              Text(
                boxName1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        //box2
        Container(
          width: 185,
          height: 189,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green, width: 0.9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image2, width: 115, fit: BoxFit.fill),
              SizedBox(height: 10,),

              Text(
                boxName2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
