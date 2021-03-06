import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ihealth/api%20configuration/apiDetails.dart';
import 'package:ihealth/api%20configuration/constant-assets.dart';
import 'package:ihealth/model/emailLoginModel.dart';
import 'package:ihealth/model/phoneLoginModel.dart';
import 'package:ihealth/pages/createNewAccountPage.dart';
import 'package:ihealth/pages/homePage.dart';
import 'package:ihealth/widgets/colors.dart';
import 'package:ihealth/widgets/font-size.dart';
import 'package:ihealth/widgets/font-style.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;

  bool isEmailSelected = true;
  bool isPhoneSelected = false;

  @override
  void initState() {
    super.initState();
    client();
  }

  client() async {
    print('i am in');
    final authorizationEndpoint =
    Uri.parse(endPoint);
    final identifier = clientId;
    final secret = clientSecret;

    var client = await oauth2.clientCredentialsGrant(
        authorizationEndpoint, identifier, secret);


    accessToken = client.credentials.accessToken;
    print(accessToken);
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
                        height: screenHeight * 0.03,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.35,
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                          Text('or',
                            style: xLargeGrey,
                          ),
                          SizedBox(
                            width: screenWidth * 0.35,
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: screenHeight * 0.02,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.2,
                          right: screenWidth * 0.2
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('google');
                                client();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5
                                  )
                                ),
                                child: Image(
                                  image: AssetImage(googleLogo),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(2),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey,
                                        width: 0.5
                                    )
                                ),
                                child: Image(
                                  image: AssetImage(fbLogo),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(0),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey,
                                        width: 0.5
                                    )
                                ),
                                child: Image(
                                  image: AssetImage(appleLogo),
                                ),
                              ),
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.15,
                ),

                Container(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1
                  ),
                  child: Row(
                    children: [
                      Text('Not a member?',
                        style: xLargeGrey,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreateNewAccountPage()));
                        },
                        child: Text('Create New Account',
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

  bool isValidEmail = false;
  bool isValidPassword = false;

  bool passwordVisibility = false;

  bool indicator = false;

  EmailLoginModel? _emailUser;

  Future<EmailLoginModel?> loginUser(String email, String password) async {

    String token = "Bearer "+accessToken;
    print(token);
    var registerUrl = Uri.parse("https://zeoner.com/ihealth/api/auth/login");
    final response = await http.post(registerUrl,headers: <String, String>{
      "Accept": "application/json",
      "Authorization": token
    }, body: {
      "auth_type": "email",
      "email": email,
      "password": password,
    });

    print(response.statusCode);

    if(response.statusCode == 200){
      String responseValue = response.body;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Successful",
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.lightBlueAccent,
      ));
      await Future.delayed(const Duration(seconds: 1), (){});
      print(responseValue);
      return emailLoginModelFromJson(responseValue);
    }
    else if(response.statusCode == 422) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Register to Login",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 500),
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

              ],
            ),
          ),

          SizedBox(
            height: screenHeight * 0.015,
          ),

          GestureDetector(
            onTap: () {
              print('Forget Password Clicked');
            },
            child: Container(
              alignment: Alignment.centerRight,
              child: Text('Forget Password?',
                style: normalPrimaryColor,
              ),
            ),
          ),

          SizedBox(
            height: screenHeight * 0.015,
          ),

          GestureDetector(
            onTap: () async {
              print('Login Clicked');
              if(_formKey.currentState!.validate()){
                setState(() {
                  indicator = true;
                });
                String userEmail = _emailController.text;
                String userPassword = _pwdController.text;
                EmailLoginModel? create = await loginUser(userEmail, userPassword);
                print(create!.token);
                  if(create != null) {
                    _emailUser = create;
                    setState(() {
                      indicator = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                  print(_emailUser!.token);

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => HomePage()));
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
              child: Text('Log in',
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

  late int _phoneUser;

  loginUser(String phone) async {

    String token = "Bearer "+accessToken;
    print(token);
    var registerUrl = Uri.parse("https://zeoner.com/ihealth/api/auth/login");
    final response = await http.post(registerUrl,headers: <String, String>{
      "Accept": "application/json",
      "Authorization": token
    }, body: {
      "auth_type": "phone",
      "phone": phone
    });

    print(response.statusCode);

    if(response.statusCode == 200){
      String responseValue = response.body;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Successful",
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.lightBlueAccent,
      ));
      await Future.delayed(const Duration(seconds: 1), (){});
      print(responseValue);
      return 1;
    }
    else if(response.statusCode == 422) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Register to Login",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 500),
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

          GestureDetector(
            onTap: () async {
              print('Login Clicked');
              if(_formKey.currentState!.validate()){
                setState(() {
                  indicator = true;
                });
                String userPhone = _phoneController.text;
                userPhone = "+91" + userPhone;
                int create = await loginUser(userPhone);
                print(create);
                if(create == 1) {
                  _phoneUser = create;
                  setState(() {
                    indicator = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
                print(_phoneUser);

               /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()));*/
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
              child: Text('Log in',
                style: largeWhite,
              ),
            ),
          ),

          SizedBox(
            height: screenHeight * 0.015,
          ),

          GestureDetector(
            onTap: () {
              print('Forget Password Clicked');
            },
            child: Container(
              alignment: Alignment.center,
              child: Text('Log in with password',
                style: normalPrimaryColor,
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


