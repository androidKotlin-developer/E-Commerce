import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Order_success extends StatefulWidget {
  const Order_success({Key? key}) : super(key: key);

  @override
  State<Order_success> createState() => _Order_successState();
}

class _Order_successState extends State<Order_success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/success.png'),
              SizedBox(height: 10,),
              Text(
                'Order Successfully Placed',
                style: GoogleFonts.roboto(
                    color: Color(0xFFDDA9A8),
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
