import 'package:app/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:app/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginRequestModel requestModel;

  @override
  void initstate(){
    super.initState();
    requestModel= new LoginRequestModel();
  }
  String value;
  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch(_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight =_keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFFBFFCD00);// Color(0xFFB1D71F2);
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset =_keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xFFBFFCD00);//Color(0xFFB1D71F2);
        _headingColor = Colors.white;

        _headingTop = 10;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = 50;// _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    //----------------------------- Welcome  Page-------------------------------------
    return Stack(
      children: <Widget>[
        AnimatedContainer(

            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
                milliseconds: 1000
            ),
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(
                              milliseconds: 1000
                          ),
                          margin: EdgeInsets.only(
                            top: _headingTop,
                          ),
                          child: Text(
                            "WELCOME",
                            style: TextStyle(
                              color: _headingColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 32
                          ),
                          child: Text(
                            "Turn your home to new age smart home.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 32
                  ),
                  child: Center(
                    child: Image.asset('assets/images/home.png',height:300),

                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(_pageState != 0){
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFB1D71F2),//Color(0xFFBFFCD00),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
        ),


        //-----------------------------Login  Page-------------------------------------


        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginWidth,
          height:_loginHeight+30,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
              milliseconds: 1000
          ),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset-30, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Login To Continue",
                      style: TextStyle(

                          fontSize: 20
                      ),
                    ),
                  ),

                  // login page ------------username field
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFBC7C7C7),
                            width: 2
                        ) ,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 60,
                            child: Icon(
                              Icons.person,
                              size: 20,
                              color: Color(0xFFBB9B9B9),
                            )
                        ),
                        Expanded(
                          child: TextFormField(
                            onSaved: (input) => requestModel.email = input,

                            decoration: InputDecoration(
                              hintText: 'Username',
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),


                  //login page -------------password field
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFBC7C7C7),
                            width: 2
                        ) ,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 60,
                            child: Icon(
                              Icons.vpn_key,
                              size: 20,
                              color: Color(0xFFBB9B9B9),
                            )
                        ),
                        Expanded(
                          child: TextFormField(
                            onSaved: (input) => requestModel.password=input,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      if(true){
                        print(requestModel.toJson());
                      }

                    },
                    child: PrimaryButton(
                      btnText: "Login",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                        setState(() {
                         _pageState = 2;
                      });

                    },
                    child: OutlineBtn(
                      btnText: "Create New Account",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),



        //-----------------------------Create Account Page-------------------------------------




        AnimatedContainer(
          height:  MediaQuery.of(context).size.height-10,//_registerHeight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
              milliseconds: 1000
          ),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Create a New Account",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),



                    // for create account -----username





                  Container(
                      decoration: BoxDecoration(
                      border: Border.all(
                      color: Color(0xFFBC7C7C7),
                      width: 2
                        ) ,
                    borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                          children: <Widget>[
                          Container(
                            width: 60,
                            child: Icon(
                            Icons.person,
                            size: 20,
                            color: Color(0xFFBB9B9B9),
                          )
                    ),
                    Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none,
                    ),
                    ),
                    )
                    ],
                    ),
                    ),

                  SizedBox(height: 20,),



                  // for create account ---------email




                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFBC7C7C7),
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 60,
                            child: Icon(
                              Icons.email,
                              size: 20,
                              color: Color(0xFFBB9B9B9),
                            )
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your E-mail',
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),

                  // for create account ---------mobile no.


                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFBC7C7C7),
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 60,
                            child: Icon(
                              Icons.send_to_mobile,
                              size: 20,
                              color: Color(0xFFBB9B9B9),
                            )
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Mobile number',
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),


                  SizedBox(height: 20,),

                  // for create account ---------password.


                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFBC7C7C7),
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 60,
                            child: Icon(
                              Icons.vpn_key,
                              size: 20,
                              color: Color(0xFFBB9B9B9),
                            )
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  // for create account ---------conform password.

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFBC7C7C7),
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 60,
                            child: Icon(
                              Icons.vpn_key,
                              size: 20,
                              color: Color(0xFFBB9B9B9),
                            )
                        ),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Conform Password',
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),


                ],
              ),







              Column(
                //   // for create account -----button 1


                children: <Widget>[
                  PrimaryButton(
                    btnText: "Create Account",
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // for create account -----button2


                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: OutlineBtn(
                        btnText: "Back To Login",
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

//-----------------------------Button Dependancy -------------------------------------


class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFB1D71F2),// Color(0xFFBFFCD00),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue,
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Color(0xFFB40284A),
              fontSize: 16
          ),
        ),
      ),
    );
  }
}
