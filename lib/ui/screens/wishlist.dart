import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final List<String> title = [
    'Men fit jeans',
    'Plain colour round jacket',
    'Men regular jeans',
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Container(
          transform: Matrix4.translationValues(-20, 0, 0),
          child: Text('Wishlist',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.start),
        ),
        actions: [
          Container(
            transform: Matrix4.translationValues(28.0, 0.0, 0.0),
            child: Image.asset("assets/images/delete.png"),
          ),
          Image.asset("assets/images/cart.png")
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 273),
            itemCount: images.length,
            itemBuilder: (context, index) => SizedBox(
                  height: 274,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.fill)),
                          child:Stack(
                            children: [
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
                                      'assets/images/cross.png',
                                      color: const Color(0xFF000000),
                                    )),
                              ),
                            ],
                          ),
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
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width, 20),
                                primary: const Color(0xFFDDA9A8),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Move To Bag',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
