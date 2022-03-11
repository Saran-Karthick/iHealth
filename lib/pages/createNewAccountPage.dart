import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ihealth/api%20configuration/apiDetails.dart';
import 'package:ihealth/api%20configuration/constant-assets.dart';
import 'package:ihealth/model/emailRegisterModel.dart';
import 'package:ihealth/model/phoneRegisterModel.dart';
import 'package:ihealth/pages/loginPage.dart';
import 'package:ihealth/widgets/colors.dart';
import 'package:ihealth/widgets/font-size.dart';
import 'package:ihealth/widgets/font-style.dart';
import 'package:http/http.dart' as http;



class CreateNewAccountPage extends StatefulWidget {
  const CreateNewAccountPage({Key? key}) : super(key: key);

  @override
  _CreateNewAccountPageState createState() => _CreateNewAccountPageState();
}

class _CreateNewAccountPageState extends State<CreateNewAccountPage> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;

  bool isEmailSelected = true;
  bool isPhoneSelected = false;

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
                stops: [0.3,0.3]
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: screenHeight * 0.05,
                ),

                //Logo
                Center(
                  child: Image(
                    image: AssetImage(logo),
                    width: screenWidth * 0.5,
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      right: 10
                  ),
                  child: Center(
                    child: Text('Put your health front and center',
                      style: logoMotoText,
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.03,
                ),

                // MainContainer
                Container(
                  margin: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05
                  ),
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05
                  ),
                  width: screenWidth,
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 5,
                          spreadRadius: 0.2,
                        )
                      ]
                  ),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    print('Email Clicked');
                                    setState(() {
                                      isEmailSelected = !isEmailSelected;
                                      isPhoneSelected = !isPhoneSelected;
                                    });
                                  },
                                  child: Text('Email',
                                    style: TextStyle(
                                        color: isEmailSelected ? primaryBlue : Colors.grey,
                                        fontSize: xxlarge
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    print('Phone Clicked');
                                    setState(() {
                                      isPhoneSelected = !isPhoneSelected;
                                      isEmailSelected = !isEmailSelected;
                                    });
                                  },
                                  child: Text('Phone',
                                    style: TextStyle(
                                        color: isPhoneSelected ? primaryBlue : Colors.grey,
                                        fontSize: xxlarge
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Stack(
                          children: [
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey,
                            ),

                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: SizedBox(
                                      width: 100,
                                      child: Divider(
                                        thickness: isEmailSelected ? 2 : 0.5,
                                        color: isEmailSelected ? primaryBlue : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: SizedBox(
                                      width: 100,
                                      child: Divider(
                                        thickness: isPhoneSelected ? 2 : 0.5,
                                        color: isPhoneSelected ? primaryBlue : Colors.grey,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: screenHeight * 0.02,
                        ),

                        isEmailSelected ? Email() : Phone(),

                        SizedBox(
                          height: screenHeight * 0.09,
                        ),


                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.15,
                ),

                Container(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.15,
                      right: screenWidth * 0.15
                  ),
                  child: Row(
                    children: [
                      Text('Already have an account?',
                        style: xLargeGrey,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text('Log In',
                          style: xLargePrimary,
                        ),
                      )
                    ],
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


class Email extends StatefulWidget {
  const Email({Key? key}) : super(key: key);

  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;

  final _formKey = new GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _conformPwdController = TextEditingController();

  bool isValidEmail = false;
  bool isValidPassword = false;
  bool isConfirmPassword = false;

  bool isChecked = false;

  bool indicator = false;

  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;

  EmailRegisterModel? _emailUser;

  Future<EmailRegisterModel?> createUser(String email, String password, String confirmPassword) async {

    String token = "Bearer "+accessToken;
    print(token);
    var registerUrl = Uri.parse("https://zeoner.com/ihealth/api/auth/register");
      final response = await http.post(registerUrl,headers: <String, String>{
        "Accept": "application/json",
        "Authorization": token
      }, body: {
        "agree_privacy_policy": "1",
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "registration_type": "email"
      });

      print(response.statusCode);

      if(response.statusCode == 200){
        String responseValue = response.body;
        print(responseValue);
        return emailRegisterModelFromJson(responseValue);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The email has already been taken",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ));
        setState(() {
          indicator = false;
        });
        return null;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Form(
            key: _formKey,
            child: Column(
              children: [

                // Email Input
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.15,
                        child: Icon(
                          Icons.email,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: VerticalDivider(
                          thickness: 2,
                          width: 2,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.5,
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            bool validEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{\}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);
                            if(validEmail) {
                              setState(() {
                                isValidEmail = true;
                              });
                            }
                            else{
                              return 'Enter Valid Email';
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email'
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Password Input
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.15,
                        child: Icon(
                          Icons.lock,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: VerticalDivider(
                          thickness: 2,
                          width: 2,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.5,
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03
                        ),
                        child: TextFormField(
                          controller: _pwdController,
                          obscureText: !passwordVisibility,
                          validator: (value) {
                            if(value == null || value.isEmpty || value.length < 6) {
                              return 'Enter Valid Password';
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password'
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            passwordVisibility = !passwordVisibility;
                          });
                        },
                        child: Icon(
                          passwordVisibility ?
                          Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Password Input
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.15,
                        child: Icon(
                          Icons.lock,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: VerticalDivider(
                          thickness: 2,
                          width: 2,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.5,
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03
                        ),
                        child: TextFormField(
                          controller: _conformPwdController,
                          obscureText: !confirmPasswordVisibility,
                          validator: (value) {

                            if(value == null || value.isEmpty || value.length < 6 || value != _pwdController.text) {
                              return 'Enter Correct Password';
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password'
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            confirmPasswordVisibility = !confirmPasswordVisibility;
                          });
                        },
                        child: Icon(
                          confirmPasswordVisibility ?
                          Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          SizedBox(
            height: screenHeight * 0.01,
          ),

          Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity(horizontal: -4, vertical: -1),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text('I agree to the'),
              SizedBox(
                width: 5,
              ),
              Text('Privacy Policy',
                style: normalPrimaryColorUnderlined,
              )
            ],
          ),

          SizedBox(
            height: indicator ? screenHeight * 0.02 : screenHeight * 0.06,
          ),

          GestureDetector(
            onTap: () async {
              print('Create New Account Clicked');
              if(isChecked) {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    indicator = true;
                  });
                  String userEmail = _emailController.text;
                  String userPassword = _pwdController.text;
                  String userConfirmPassword = _conformPwdController.text;
                  EmailRegisterModel? create = await createUser(userEmail,userPassword, userConfirmPassword);
                  print(create!.token);
                  if(create != null) {
                    setState(() {
                      _emailUser = create;
                      indicator = false;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                  print(_emailUser!.token);

                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateNewAccountPage())); */
                }
              }
            },
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(5)
              ),
              alignment: Alignment.center,
              child: Text('Create New Account',
                style: largeWhite,
              ),
            ),
          ),

          SizedBox(
            height: screenHeight * 0.02,
          ),

          Visibility(
            visible: indicator,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )

        ],
      ),
    );
  }
}



class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;

  final _formKey = new GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  bool isValidPhone = false;
  bool isValidCode = false;

  bool indicator = false;
  bool isChecked = false;

  int _phoneUser = 0;

   createUser(String phone) async {

    String token = "Bearer "+accessToken;
    print(token);
    var registerUrl = Uri.parse("https://zeoner.com/ihealth/api/auth/register");
    final response = await http.post(registerUrl,headers: <String, String>{
      "Accept": "application/json",
      "Authorization": token
    }, body: {
      "agree_privacy_policy": "1",
      "phone": phone,
      "registration_type": "phone"
    });

    print(response.statusCode);

    if(response.statusCode == 200){
      String responseValue = response.body;
      print(responseValue);
      return 1;
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("The phone number has already been taken",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ));
      setState(() {
        indicator = false;
      });
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Form(
            key: _formKey,
            child: Column(
              children: [

                // Email Input
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.15,
                        child: Icon(
                          Icons.email,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: VerticalDivider(
                          thickness: 2,
                          width: 2,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('(+91)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.4,
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03
                        ),
                        child: TextFormField(
                          controller: _phoneController,
                          validator: (value) {
                            bool validEmail = RegExp(r"^[0-9]{10}$").hasMatch(_phoneController.text);
                            if(validEmail) {
                              setState(() {
                                isValidPhone = true;
                              });
                            }
                            else{
                              return 'Enter Valid Phone Number';
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone Number'
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Password Input
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.15,
                        child: Icon(
                          Icons.email,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                        child: VerticalDivider(
                          thickness: 2,
                          width: 2,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.35,
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03
                        ),
                        child: TextFormField(
                          controller: _codeController,
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Enter Valid Code';
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Code'
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 75,
                          height: 25,
                          decoration: BoxDecoration(
                              color: primaryBlue,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          alignment: Alignment.center,
                          child: Text('Get Code',
                            style: mediumWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          SizedBox(
            height: screenHeight * 0.01,
          ),

          Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity(horizontal: -4, vertical: -1),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text('I agree to the'),
              SizedBox(
                width: 5,
              ),
              Text('Privacy Policy',
                style: normalPrimaryColorUnderlined,
              )
            ],
          ),

          SizedBox(
            height: indicator ? screenHeight * 0.1 : screenHeight * 0.17,
          ),

          GestureDetector(
            onTap: () async {
              print('Create New Account Clicked');
              if(isChecked) {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    indicator = true;
                  });
                  var userPhone = _phoneController.text;
                  userPhone = "+91"+userPhone;
                  int create = await createUser(userPhone);
                  print(create);
                  if(create == 1) {
                    _phoneUser = create;
                    setState(() {
                      indicator = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                  print(_phoneUser);

                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateNewAccountPage())); */
                }
              }
            },
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(5)
              ),
              alignment: Alignment.center,
              child: Text('Create New Account',
                style: largeWhite,
              ),
            ),
          ),

          SizedBox(
            height: screenHeight * 0.02,
          ),

          Visibility(
            visible: indicator,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )

        ],
      ),
    );
  }
}
