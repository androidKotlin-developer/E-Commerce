import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ylo/ui/screens/catagories/jackets.dart';
import 'package:ylo/ui/screens/catagories/shirts.dart';
import 'package:ylo/ui/screens/catagories/shoes.dart';

class Catagories extends StatefulWidget {
  const Catagories({Key? key}) : super(key: key);

  @override
  State<Catagories> createState() => _CatagoriesState();
}

class _CatagoriesState extends State<Catagories> {
  final List<String> catagories = [
    "assets/images/jackets.png",
    "assets/images/shirts.png",
    "assets/images/explorestyle.png",
    "assets/images/tshirt.png",
    "assets/images/shorts.png",
    "assets/images/jackets.png"
  ];
  final List<String> categoryname = [
    'Jackets',
    'Shirts',
    'Shoes',
    'T- Shirts',
    'Shorts',
    'Shorts'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: catagories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => categoryname[index] == "Jackets"
                            ? const Jackets()
                            : categoryname[index] == "Shirts"
                                ? const Shirts()
                                : categoryname[index] == "Shoes"
                                    ? const Shoes()
                                    : const Jackets()));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Container(
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(catagories[index]),
                            ))),
                    Positioned(
                        top: 30,
                        left: 16,
                        child: Text(
                          categoryname[index],
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                    Positioned(
                      top: 50,
                      left: 16,
                      child: Text(
                        "Explore Your true Style",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
