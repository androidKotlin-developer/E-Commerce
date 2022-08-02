import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ShopCard(BuildContext context) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    height: 100,
    width: MediaQuery.of(context).size.width * 0.45,
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/jackets.png"),
              )),
        ),
        Positioned(
            top: 60,
            left: 15,
            child: Column(
              children: [
                Text(
                  'Jackets',
                  style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  'Starting At rs 899',
                  style: GoogleFonts.roboto(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ))
      ],
    ),
  );
}

Widget LoginCard(BuildContext context) {
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: Column(
        children: [
          Text(
            'Log In',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
