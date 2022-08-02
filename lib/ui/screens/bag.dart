import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ylo/ui/screens/order_success.dart';

String _selectSize = "Size";
String _selectQuantity = "Quantity";
bool _addressCheckbox = true;

class Bag extends StatefulWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  bool _showbagcontainer = true;
  bool _showaddresscontainer = false;
  bool onBag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Bag',
            style: GoogleFonts.roboto(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start),
        actions: [Image.asset("assets/images/like.png")],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Visibility(
                    child: bagWidget(),
                    visible: _showbagcontainer,
                  ),
                  Visibility(
                    child: addressWidget(),
                    visible: _showaddresscontainer,
                  ),
                  Expanded(
                      child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.only(right: 20, left: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.9, 50),
                            primary: const Color(0xFFDDA9A8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          setState(() {
                            if (onBag) {
                              if (_showbagcontainer) {
                                _showbagcontainer = !_showbagcontainer;
                                _showaddresscontainer = !_showaddresscontainer;
                                onBag = false;
                              }
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Order_success()));
                            }
                          });
                        },
                        child: Text(
                          'Continue',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ))
                ],
              )),
        ),
      ),
    );
  }

  Widget bagWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bag',
                style: GoogleFonts.roboto(
                    color: const Color(0xFFDDA9A8),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              const DottedLine(
                direction: Axis.horizontal,
                lineLength: 100,
                lineThickness: 2.0,
                dashLength: 4.0,
                dashColor: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Address',
                style: GoogleFonts.roboto(
                    color: const Color(0xFF000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                transform: Matrix4.translationValues(0, -10, 0),
                child: Image.asset(
                  'assets/images/offer.png',
                  width: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Offers',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
                    child: Text(
                      overflow: TextOverflow.clip,
                      '10% instant discount on Punjab national bank debit/credit  cards on min spent of Rs 1000 ',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400, fontSize: 11),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            'Order Summary',
            style: GoogleFonts.roboto(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xCC9A9A9A), width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset('assets/images/jacket1.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Globster',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    Text(
                      'Inside Woolen Comfort',
                      style: GoogleFonts.roboto(
                          color: const Color(0xFF30323E),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    Row(
                      children: [
                        DropdownButton<String>(
                          items: ["Size", 'A', 'B', 'C', 'D']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13),
                              ),
                            );
                          }).toList(),
                          value: _selectSize,
                          onChanged: (newValue) {
                            setState(() {
                              _selectSize = newValue as String;
                            });
                          },
                        ),
                        // DropdownButton<String>(
                        //   items: [
                        //     "Quantity"
                        //     "1",
                        //     "2",
                        //     "3",
                        //     "4",
                        //   ].map<DropdownMenuItem<String>>((String value) {
                        //     return DropdownMenuItem<String>(
                        //         value: value,
                        //         child: Text(
                        //           value,
                        //           style: const TextStyle(
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.w700,
                        //               fontSize: 13),
                        //         ));
                        //   }).toList(),
                        //   value: _selectQuantity,
                        //   onChanged: (newValue) {
                        //     setState(() {
                        //       _selectQuantity = newValue as String;
                        //     });
                        //   },
                        // )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("\$50"),
                        SizedBox(
                          width: 15,
                        ),
                        Text("\$150",
                            style: TextStyle(fontStyle: FontStyle.italic)),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "15% OFF",
                          style: TextStyle(color: Color(0xFFDDA9A8)),
                        )
                      ],
                    ),
                    Text(
                      "Delivered by something ",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 11),
                      overflow: TextOverflow.clip,
                    )
                  ],
                ),
                Container(
                    alignment: Alignment.topRight, child: Icon(Icons.cancel))
              ],
            ),
          ),
        ),
        Card(
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFFDDA9A8),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          borderOnForeground: true,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                "Apply Coupon",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: const Color(0xFFDDA9A8),
                ),
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xCC9A9A9A),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color(0xFF000000),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL MRP",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xCC9A9A9A),
                      ),
                    ),
                    Text(
                      "\$150",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xCC9A9A9A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "COUPON DISCOUNT",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xCC9A9A9A),
                      ),
                    ),
                    Text(
                      "-",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xCC9A9A9A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SHIPPING FEE",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xCC9A9A9A),
                      ),
                    ),
                    Text(
                      "\$0.2",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xCC9A9A9A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Container(
                    color: const Color(0xFFA8A8A8),
                    height: 2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL AMOUNT",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xCC9A9A9A),
                      ),
                    ),
                    Text(
                      "\$150.2",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xCC9A9A9A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget addressWidget() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bag',
                  style: GoogleFonts.roboto(
                      color: const Color(0xFFDDA9A8),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 10,
                ),
                const DottedLine(
                  direction: Axis.horizontal,
                  lineLength: 100,
                  lineThickness: 2.0,
                  dashLength: 4.0,
                  dashColor: Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Address',
                  style: GoogleFonts.roboto(
                      color: const Color(0xFF000000),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFFDDA9A8),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/Vector.png"),
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                    activeColor: const Color(0xFFDDA9A8),
                    value: _addressCheckbox,
                    onChanged: (_) {
                      setState(() {
                        _addressCheckbox = !_addressCheckbox;
                      });
                    }),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Haresh",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: const Color(0xFF827C7C),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mobile No: 2547762624",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xFF827C7C),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Titanium City center ,Ahemdabad, 125876",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xFF827C7C),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Card(
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFFDDA9A8),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          borderOnForeground: true,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "EDIT",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: const Color(0xFFDDA9A8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Card(
            shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xCC9A9A9A),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL MRP",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xCC9A9A9A),
                        ),
                      ),
                      Text(
                        "\$150",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xCC9A9A9A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "COUPON DISCOUNT",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xCC9A9A9A),
                        ),
                      ),
                      Text(
                        "-",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xCC9A9A9A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SHIPPING FEE",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xCC9A9A9A),
                        ),
                      ),
                      Text(
                        "\$0.2",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xCC9A9A9A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Container(
                      color: const Color(0xFFA8A8A8),
                      height: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL AMOUNT",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xCC9A9A9A),
                        ),
                      ),
                      Text(
                        "\$150.2",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xCC9A9A9A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
