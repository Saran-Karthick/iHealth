import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihealth/api%20configuration/constant-assets.dart';
import 'package:ihealth/pages/selectTypePage.dart';
import 'package:ihealth/widgets/colors.dart';
import 'package:ihealth/widgets/font-style.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: screenHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryBlue,Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.25,0.25]
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: screenHeight * 0.03,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05
                  ),
                  child: Text('iHealth Test',
                    style: logoWhite,
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.01,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05
                  ),
                  child: Text('iHealth Test is intended to be used as an aid in the diagnosis of a current infection with the virus that cause COVID - 19.',
                    style: mediumHalfWhite,
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.03,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text('Learn More',
                          style: largeWhiteBold,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: white,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.07,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage(homeImg),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.1,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SelectTypePage()));
                    },
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      alignment: Alignment.center,
                      child: Text('Watch Video & Test',
                        style: largeWhite,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.055,
                ),

                Container(
                  width: screenWidth,
                  height: screenHeight * 0.05,
                  decoration: BoxDecoration(
                    color: halfWhite
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Purchase test kit',
                          style: largeOrange,
                        ),
                        Icon(
                          Icons.arrow_right_outlined,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ),
                )


              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(Icons.home),
                    Text('Test',
                      style: TextStyle(
                        color: _selectedIndex == 0 ? primaryBlue : Colors.grey
                      ),
                    )
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(Icons.business),
                    Text('Groups',
                      style: TextStyle(
                          color: _selectedIndex == 1 ? primaryBlue : Colors.grey
                      ),
                    )
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(Icons.school),
                    Text('Pass',
                      style: TextStyle(
                          color: _selectedIndex == 2 ? primaryBlue : Colors.grey
                      ),
                    )
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(Icons.business),
                    Text('Account',
                      style: TextStyle(
                          color: _selectedIndex == 3 ? primaryBlue : Colors.grey
                      ),
                    )
                  ],
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: primaryBlue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),


        ),
      )
    );
  }
}
