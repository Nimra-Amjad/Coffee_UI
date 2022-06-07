import 'package:coffee_ui/util/coffee_tile.dart';
import 'package:coffee_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeetype = [
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false]
  ];

  void coffeetypeselected(int index) {
    setState(() {
      for (int i = 0; i < coffeetype.length; i++) {
        coffeetype[index][1] == false;
      }
      coffeetype[index][1] == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), backgroundColor: Colors.white, label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "")
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 40),
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee !',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeetype.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                    coffeetype: coffeetype[index][0],
                    isselected: coffeetype[index][1],
                    onTap: () {
                      coffeetypeselected(index);
                    });
              },
            ),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(
                  coffeeimagepath: 'assets/images/coffee1.jpg',
                  coffeename: 'Latte',
                  coffeeprice: '4.20'),
              CoffeeTile(
                  coffeeimagepath: 'assets/images/coffee2.jpg',
                  coffeename: 'Cappucino',
                  coffeeprice: '4.20'),
              CoffeeTile(
                  coffeeimagepath: 'assets/images/coffee3.jpg',
                  coffeename: 'Black',
                  coffeeprice: '4.20'),
              CoffeeTile(
                  coffeeimagepath: 'assets/images/coffee4.jpg',
                  coffeename: 'Tea',
                  coffeeprice: '4.20'),
            ],
          ))
        ],
      ),
    );
  }
}
