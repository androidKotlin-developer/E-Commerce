import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:ylo/ui/screens/account_page.dart';
import 'package:ylo/ui/screens/catagories.dart';
import 'package:ylo/ui/screens/main_page.dart';
import 'package:ylo/ui/screens/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  int _page = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: _page);
    super.initState();
  }

  Widget bodyFunction() {
    switch (_page) {
      case 0:
        return const MainPage();

      case 1:
        return const Catagories();

      case 2:
        return const Search();

      default:
        return const Account();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _showLoginBottomSheet = true;
    bool _showOtpBottomScreen = false;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 4,
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 40,
            icon: Image.asset(
              "assets/images/Vector.png",
              color: Colors.black,
              height: 40,
              width: 40,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              context: context,
              builder: (context) => Container(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: _showLoginBottomSheet,
                    child: SizedBox(
                        child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Log In',
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: GoogleFonts.montserrat(
                                fontSize: 16, color: Colors.grey),
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Phone Number',
                              hintStyle: GoogleFonts.montserrat(
                                  fontSize: 16, color: const Color(0xFF818181)),
                              label: const Text('Phone Number'),
                              prefix: Text(
                                '+91 | ',
                                style: GoogleFonts.montserrat(
                                    color: const Color(0xFF818181)),
                              ),
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize:
                                    Size(MediaQuery.of(context).size.width, 50),
                                primary: const Color(0xFFDDA9A8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              setState(() {
                                _showLoginBottomSheet = false;
                                _showOtpBottomScreen = true;
                              });
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                context: context,
                                builder: (context) => Column(
                                  children: [
                                    Visibility(
                                      visible: _showOtpBottomScreen,
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Verify',
                                              style: GoogleFonts.inter(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'We have send the verification code to \nyour mobile no',
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            PinPut(
                                              fieldsCount: 4,
                                              onSubmit: (String pin) =>
                                                  _showSnackBar(pin, context),
                                              focusNode: _pinPutFocusNode,
                                              controller: _pinPutController,
                                              submittedFieldDecoration:
                                                  _pinPutDecoration.copyWith(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              selectedFieldDecoration:
                                                  _pinPutDecoration,
                                              followingFieldDecoration:
                                                  _pinPutDecoration.copyWith(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.9,
                                                      50),
                                                  primary:
                                                      const Color(0xFFDDA9A8),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage()));
                                              },
                                              child: Text(
                                                'Submit',
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 22),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'By continuing zylo',
                                                  style: GoogleFonts.inter(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  'Term’s & Conditions',
                                                  style: GoogleFonts.inter(
                                                      color: Color(0xFFDDA9A8),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              'Get OTP',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'By continuing zylo',
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Term’s & Conditions',
                                style: GoogleFonts.inter(
                                    color: Color(0xFFDDA9A8),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                ],
              )),
            );
          },
          child: Container(
            transform: Matrix4.translationValues(-28.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 20,
                  width: 20,
                ),
                Image.asset(
                  "assets/images/ylo.png",
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            transform: Matrix4.translationValues(28.0, 0.0, 0.0),
            child: Image.asset("assets/images/like.png"),
          ),
          Image.asset("assets/images/cart.png")
        ],
      ),
      resizeToAvoidBottomInset: true,
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFC2C2C2)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, color: Color(0xFFC2C2C2)),
            label: 'Catagories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color(0xFFC2C2C2)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box, color: Color(0xFFC2C2C2)),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            _controller.jumpToPage(index);
          });
        },
        currentIndex: _page,
        selectedItemColor: const Color(0xFFDDA9A8),
      ),
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            _page = page;
          });
        },
        controller: _controller,
        children: const [MainPage(), Catagories(), Search(), Account()],
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
