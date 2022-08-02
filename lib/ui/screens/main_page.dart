import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shop_card/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int imgposition = 0;
  final List<String> img = [
    "assets/images/shopimg.png",
    "assets/images/shopimg.png",
    "assets/images/shopimg.png",
  ];
  final List<String> price = ['₹ 899', '₹ 799', '₹ 999', '₹ 895'];
  final List<String> categoryname = [
    'Jackets',
    'Tops',
    'Denim jackets',
    'shirts'
  ];
  final List<String> categories = [
    "assets/images/jacket.png",
    "assets/images/top.png",
    "assets/images/denim_jk.png",
    "assets/images/jacket.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 150,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    const SizedBox(
                      width: 20,
                    ),
                    ShopCard(context),
                    const SizedBox(
                      width: 20,
                    ),
                    ShopCard(context),
                    const SizedBox(
                      width: 20,
                    ),
                    ShopCard(context),
                    const SizedBox(
                      width: 20,
                    ),
                    ShopCard(context),
                    const SizedBox(
                      width: 20,
                    ),
                    ShopCard(context),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 285,
                            width: MediaQuery.of(context).size.width,
                            child: PageView.builder(
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  img[index],
                                  width: MediaQuery.of(context).size.width,
                                  height: 285,
                                  fit: BoxFit.fill,
                                );
                              },
                              itemCount: img.length,
                              pageSnapping: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index) {
                                setState(() {
                                  imgposition = index;
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 285,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('New Summer Collection',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                          Text('Explore your true Style',
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFDDA9A8),
                                fixedSize: Size(118, 32)),
                            onPressed: () {},
                            child: Text(
                              'Shop Now',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: '.',
                      style: imgposition == 0
                          ? const TextStyle(
                              color: Color(0xFFDDA9A8), fontSize: 30.0)
                          : const TextStyle(color: Colors.grey, fontSize: 30.0),
                      children: [
                        TextSpan(
                          text: '.',
                          style: imgposition == 1
                              ? const TextStyle(
                                  color: Color(0xFFDDA9A8), fontSize: 30.0)
                              : const TextStyle(
                                  color: Colors.grey, fontSize: 30.0),
                        ),
                        TextSpan(
                          text: '.',
                          style: imgposition == 2
                              ? const TextStyle(
                                  color: Color(0xFFDDA9A8), fontSize: 30.0)
                              : const TextStyle(
                                  color: Colors.grey, fontSize: 30.0),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(
                  "Find Your Perfect Outfit",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            categories[index],
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5, top: 10),
                            child: Text(
                              categoryname[index],
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5, top: 3),
                            child: Text(
                              price[index],
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/explorestyle.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      top: 135,
                      left: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFDDA9A8),
                            fixedSize: Size(120, 21)),
                        onPressed: () {},
                        child: Text(
                          'Explore your style',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
