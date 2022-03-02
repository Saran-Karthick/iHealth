import 'package:flutter/material.dart';
import 'package:ihealth/api%20configuration/constant-assets.dart';
import 'package:ihealth/widgets/colors.dart';
import 'package:ihealth/widgets/font-style.dart';



class SelectResultPageTwo extends StatefulWidget {
  const SelectResultPageTwo({Key? key}) : super(key: key);

  @override
  _SelectResultPageTwoState createState() => _SelectResultPageTwoState();
}

class _SelectResultPageTwoState extends State<SelectResultPageTwo> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;

  bool isYes = false;
  bool isNo = false;

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
          title: Text('Select Result'),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: screenHeight * 0.03,
              ),

              Row(
                children: [

                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(
                          color: Colors.orange,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text('1',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 40,
                    child: Divider(
                      color: Colors.orange,
                      thickness: 2,
                    ),
                  ),

                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(
                          color: Colors.orange,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text('2',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 40,
                    child: Divider(
                      color: Colors.orange,
                      thickness: 2,
                    ),
                  ),

                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.orange,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text('3',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Divider(
                      color: Colors.orange,
                      thickness: 2,
                    ),
                  ),

                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.orange,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text('4',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Divider(
                      color: Colors.orange,
                      thickness: 2,
                    ),
                  ),

                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.orange,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text('5',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 40,
                    child: Divider(
                      color: Colors.orange,
                      thickness: 2,
                    ),
                  ),

                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.orange,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text('6',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: screenHeight * 0.03,
              ),

              Text('''LOOK CAREFULLY THEN ANSWER\nTHESE QUESTIONS BELOW''',
                  style: xLargeBlackBold
              ),

              SizedBox(
                height: screenHeight * 0.03,
              ),

              Center(
                child: Image(
                  image: AssetImage(testImgTwo),
                ),
              ),

              SizedBox(
                height: screenHeight * 0.03,
              ),

              Center(
                child: Text('1. Does C line appear?',
                  style: xLargeBlack,
                ),
              ),

              SizedBox(
                height: screenHeight * 0.02,
              ),

              Center(
                child: Container(
                  width: screenWidth * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if(isYes == false && isNo == false && activateButton == false){
                              isYes = true;
                              activateButton = true;
                            }
                            else{
                              isYes = !isYes;
                              isNo = !isNo;
                            }
                          });
                        },
                        child: Container(
                          width: screenWidth * 0.18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: isYes ? primaryBlue : white,
                                    border: Border.all(
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                              ),
                              Text('YES',
                                style: xLargeBlack,
                              )
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if(isYes == false && isNo == false && activateButton == false){
                              isNo = true;
                              activateButton = true;
                            }
                            else{
                              isYes = !isYes;
                              isNo = !isNo;
                            }
                          });
                        },
                        child: Container(
                          width: screenWidth * 0.18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: isNo ? primaryBlue : white,
                                    border: Border.all(
                                        color: Colors.grey
                                    ),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                              ),
                              Text('NO',
                                style: xLargeBlack,
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
                height: screenHeight * 0.15,
              ),

              GestureDetector(
                onTap: () {
                  if(activateButton) {
                   /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectResultPageTwo())); */
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
                      child: Text('Submit',
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


            ],
          ),
        ),
      ),
    );
  }
}
