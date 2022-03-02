import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihealth/pages/importantPage.dart';
import 'package:ihealth/widgets/colors.dart';
import 'package:ihealth/widgets/font-size.dart';
import 'package:ihealth/widgets/font-style.dart';



class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;

  final _formKey = new GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();

  bool isMale = false;
  bool isFemale = false;
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
          title: Text('Create Your Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.15),
                  child: Text('Note: This information is required by the state and US government to track the spread of COVID-19.',
                    style: normalGrey,
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.03,
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RichText(
                        text: TextSpan(
                            text: 'First Name',
                            style: xxLargeBlack,
                            children: [
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: xxlarge))
                            ]),
                      ),

                      SizedBox(
                        height: screenHeight * 0.01,
                      ),

                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Container(
                          width: screenWidth * 0.5,
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.03
                          ),
                          child: TextFormField(
                            controller: _firstNameController,
                            validator: (value) {
                              if(value == null || value.isEmpty) {
                                return 'Enter Valid Name';
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'First Name'
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: screenHeight * 0.03,
                      ),

                      RichText(
                        text: TextSpan(
                            text: 'Last Name',
                            style: xxLargeBlack,
                            children: [
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: xxlarge))
                            ]),
                      ),

                      SizedBox(
                        height: screenHeight * 0.01,
                      ),

                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Container(
                          width: screenWidth * 0.5,
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.03
                          ),
                          child: TextFormField(
                            controller: _lastNameController,
                            validator: (value) {
                              if(value == null || value.isEmpty) {
                                return 'Enter Valid Name';
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Last Name'
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: screenHeight * 0.03,
                      ),

                      RichText(
                        text: TextSpan(
                            text: 'Date of Birth',
                            style: xxLargeBlack,
                            children: [
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: xxlarge))
                            ]),
                      ),

                      SizedBox(
                        height: screenHeight * 0.01,
                      ),

                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Container(
                          width: screenWidth * 0.5,
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.03
                          ),
                          child: TextFormField(
                            controller: _dobController,
                            validator: (value) {
                              if(value == null || value.isEmpty) {
                                return 'Enter Valid DOB';
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Date of Birth'
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: screenHeight * 0.03,
                      ),

                      RichText(
                        text: TextSpan(
                            text: 'Gender',
                            style: xxLargeBlack,
                            children: [
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: xxlarge))
                            ]),
                      ),

                      SizedBox(
                        height: screenHeight * 0.01,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if(isMale == false && isFemale == false && activateButton == false){
                                  isMale = true;
                                  activateButton = true;
                                }
                                else{
                                  isMale = !isMale;
                                  isFemale = !isFemale;
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.12,
                                right: screenWidth * 0.12
                              ),
                              width: screenWidth * 0.43,
                              height: screenHeight * 0.06,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isMale ? primaryBlue : Colors.grey
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: isMale ? primaryBlue : Colors.grey,
                                    size: 26,
                                  ),
                                  Text('Male',
                                    style: TextStyle(
                                        color: isMale ? primaryBlue : Colors.grey,
                                        fontSize: xlarge
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if(isMale == false && isFemale == false && activateButton == false){
                                  isFemale = true;
                                  activateButton = true;
                                }
                                else{
                                  isMale = !isMale;
                                  isFemale = !isFemale;
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.10,
                                  right: screenWidth * 0.10
                              ),
                              width: screenWidth * 0.43,
                              height: screenHeight * 0.06,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: isFemale ? primaryBlue : Colors.grey
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: isFemale ? primaryBlue : Colors.grey,
                                    size: 26,
                                  ),
                                  Text('Female',
                                    style: TextStyle(
                                        color: isFemale ? primaryBlue : Colors.grey,
                                        fontSize: xlarge
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          
                        ],
                      )

                    ],
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.15,
                ),
                
                GestureDetector(
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ImportantPage()));
                    }
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: activateButton ? primaryBlue : Colors.grey,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    alignment: Alignment.center,
                    child: Text('Save',
                      style: largeWhite,
                    ),
                  ),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
