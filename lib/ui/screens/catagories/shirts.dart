import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../details_page.dart';

class Shirts extends StatefulWidget {
  const Shirts({Key? key}) : super(key: key);

  @override
  State<Shirts> createState() => _ShirtsState();
}

class _ShirtsState extends State<Shirts> {
  final List<String> title = [
    'Men fit jeans',
    'Plain colour round jacket',
    'Men regular jeans',
    'Women Skinny fit jeans',
    'Men fit jeans',
    'Women Skinny fit jeans',
    'Men fit jeans',
    'Women Skinny fit jeans',
    'Men fit jeans',
    'Women Skinny fit jeans',
  ];

  final List<String> price = [
    '₹ 699',
    '₹ 799',
    '₹ 899',
    '₹ 999',
    '₹ 699',
    '₹ 599',
    '₹ 399',
    '₹ 599',
    '₹ 399',
    '₹ 599',
  ];
  final List<String> images = [
    "assets/images/jeans.png",
    "assets/images/wjeans.png",
    "assets/images/jeans2.png",
    "assets/images/wjeans2.png",
    "assets/images/jeans.png",
    "assets/images/wjeans.png",
    "assets/images/jeans.png",
    "assets/images/wjeans.png",
    "assets/images/jeans.png",
    "assets/images/wjeans.png",
  ];

  final List<String> offer = [
    '(30% off)',
    '(40% off)',
    '(20% off)',
    '(10% off)',
    '(40% off)',
    '(60% off)',
    '(40% off)',
    '(60% off)',
    '(40% off)',
    '(60% off)',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          transform: Matrix4.translationValues(-20, 0, 0),
          child: Text('Shirts',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.start),
        ),
        actions: [
          Container(
            transform: Matrix4.translationValues(28.0, 0.0, 0.0),
            child: Image.asset("assets/images/like.png"),
          ),
          Image.asset("assets/images/cart.png")
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Card(
                elevation: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/sort.png',
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          'Sort',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Text('|'),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/sort.png',
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          'Filter',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Details_Page()));
                    },
                    child: Container(
                      // margin: const EdgeInsets.only(left: 5, right: 5),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(images[index]),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 10,
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Image.asset(
                                        'assets/images/like.png',
                                        color: const Color(0xFFF06573),
                                      )),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, top: 5),
                              child: Text(
                                title[index],
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, top: 5),
                              child: Text(
                                price[index],
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 5, top: 5),
                                child: Text(
                                  offer[index],
                                  style: GoogleFonts.roboto(
                                      color: Colors.red.shade300,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
