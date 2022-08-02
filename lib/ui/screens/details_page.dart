import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ylo/ui/screens/bag.dart';
import 'package:ylo/ui/screens/wishlist.dart';

class Details_Page extends StatefulWidget {
  const Details_Page({Key? key}) : super(key: key);

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 480,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/jacket1.png"),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CircleAvatar(
                     backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back , color: Colors.black,),
                          )),
                    ),
                    Positioned(
                      top: 10,
                      right: 50,
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.asset('assets/images/like.png')),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.asset('assets/images/cart.png')),
                    ),
                    Positioned(
                      top: 410,
                      child: Image.asset('assets/images/viewsimilar.png'),
                    ),
                    Positioned(
                      top: 415,
                      left: 40,
                      child: Text(
                        'View Similar',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  transform: Matrix4.translationValues(0, -20, 0),
                  child: const Text(
                    '....',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Globster',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Plain Round colar jacket',
                          style: GoogleFonts.roboto(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '₹ 759',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '(40% off)',
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFDDA9A8),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -25, 0),
                      child: Row(
                        children: [
                          Text(
                            '4.6',
                            style: GoogleFonts.roboto(
                                color: Colors.black, fontSize: 14),
                          ),
                          Image.asset(
                            'assets/images/star.png',
                            height: 20,
                            width: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Size',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Size Chart',
                      style: GoogleFonts.poppins(
                          color: const Color(0xFFDDA9A8),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.4, 20),
                              primary: const Color(0xFFFBA0A2),
                              side: const BorderSide(
                                  color: Color(0xFFFBA0A2), width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const WishList()));
                          },
                          child: Text(
                            "Wishlist",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: const Color(0xFFFBA0A2),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.only(right: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.4, 20),
                              primary: const Color(0xFFDDA9A8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Bag()));
                          },
                          child: Text(
                            'Add to Bag',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
