import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeimagepath;
  final String coffeename;
  final String coffeeprice;
  const CoffeeTile({
    Key? key,
    required this.coffeeimagepath,
    required this.coffeename,
    required this.coffeeprice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 200,
        height: 700,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.black54),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(coffeeimagepath)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeename,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Text(
                    "With Alomnd Milk",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$" + coffeeprice),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
