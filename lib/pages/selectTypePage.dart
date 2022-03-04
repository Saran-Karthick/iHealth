import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihealth/pages/createProfilePage.dart';
import 'package:ihealth/widgets/colors.dart';
import 'package:ihealth/widgets/font-size.dart';
import 'package:ihealth/widgets/font-style.dart';



class SelectTypePage extends StatefulWidget {
  const SelectTypePage({Key? key}) : super(key: key);

  @override
  _SelectTypePageState createState() => _SelectTypePageState();
}

class _SelectTypePageState extends State<SelectTypePage> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;

  bool isSelfCollect = false;
  bool isCollectForAnother = false;

  bool activateButton = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBlue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          title: Text('Select Type'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: screenHeight * 0.03,
            ),

            Center(
              child: Text('Select type of sample-collection',
                style: xxLargeBlackBold
              ),
            ),

            SizedBox(
              height: screenHeight * 0.02,
            ),

            Center(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 5,
                        spreadRadius: 0.1,
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.75,
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        color: primaryBlue
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(isSelfCollect == false && isCollectForAnother == false && activateButton == false){
                            isSelfCollect = !isSelfCollect;
                            activateButton = !activateButton;
                          }
                          else{
                            isCollectForAnother = !isCollectForAnother;
                            isSelfCollect = !isSelfCollect;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 15
                        ),
                        width: screenWidth * 0.75,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                            color: white
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: isSelfCollect ? primaryBlue : white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.grey
                                )
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Self-Collect',
                              style: xLargeBlack
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: screenHeight * 0.03,
            ),

            Center(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 5,
                        spreadRadius: 0.1,
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.75,
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                          color: primaryBlue
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(isSelfCollect == false && isCollectForAnother == false && activateButton == false){
                            isCollectForAnother = !isCollectForAnother;
                            activateButton = !activateButton;
                          }
                          else{
                            isCollectForAnother = !isCollectForAnother;
                            isSelfCollect = !isSelfCollect;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15,
                        ),
                        width: screenWidth * 0.75,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                            color: white
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: isCollectForAnother ? primaryBlue : white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.grey
                                  )
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Collect for another person',
                                style: xLargeBlack
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


            SizedBox(
              height: screenHeight * 0.12,
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05
              ),
              child: GestureDetector(
                onTap: () {
                  if(activateButton) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfilePage()));
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      alignment: Alignment.center,
                      child: Text('Continue',
                        style: largeWhite,
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: activateButton ? Colors.transparent : Colors.white70
                      ),
                    )
                  ],
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
