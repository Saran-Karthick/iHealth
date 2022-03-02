import 'package:flutter/material.dart';
import 'package:ihealth/api%20configuration/constant-assets.dart';
import 'package:ihealth/pages/selectResultPageOne.dart';
import 'package:ihealth/widgets/colors.dart';
import 'package:ihealth/widgets/font-style.dart';



class ImportantPage extends StatefulWidget {
  const ImportantPage({Key? key}) : super(key: key);

  @override
  _ImportantPageState createState() => _ImportantPageState();
}

class _ImportantPageState extends State<ImportantPage> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;


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
          title: Text('IMPORTANT'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: screenHeight * 0.05,
            ),

            Center(
              child: Image(
                image: AssetImage(handWashImg),
              ),
            ),

            Center(
              child: Text('Wash your hands before starting test.'),
            ),

            SizedBox(
              height: screenHeight * 0.03,
            ),

            Center(
              child: Image(
                image: AssetImage(timeImg),
              ),
            ),

            Center(
              child: Text('Testing time: 5 minutes'),
            ),

            SizedBox(
              height: screenHeight * 0.01,
            ),

            Center(
              child: Text('Time to result: 15 minutes'),
            ),

            SizedBox(
              height: screenHeight * 0.35,
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
                      MaterialPageRoute(builder: (context) => SelectResultPageOne()));
                },
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  alignment: Alignment.center,
                  child: Text('Start',
                    style: largeWhite,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
