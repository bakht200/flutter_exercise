import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:productbox_flutter_exercise/Widget/bezierContainer.dart';
import 'package:productbox_flutter_exercise/controller/controller.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  var data = Get.put(Controllerclass());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [

          Stack(
            children: [
              Positioned(
                  top: height-120,
                  right: -MediaQuery.of(context).size.width *.6,
                  child: Image.asset("assets/2.png",)),
              Positioned(
                  top: -height*.19,
                  left: -MediaQuery.of(context).size.width *.5,
                  child: Image.asset("assets/6.png",)),
              Positioned(
                  top: height /128,
                  left: -MediaQuery.of(context).size.width *.2,
                  child: Image.asset("assets/5.png")),
              Positioned(
                  top: height /1.3,
                  left: -MediaQuery.of(context).size.width *.34,
                  child: Image.asset("assets/4.png",scale: 2.1,)),
            ],
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .3),
                    Text('Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width - 3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(width: 1, style: BorderStyle.solid)),
                        child: TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                              hintText: 'Username',
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width - 3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(width: 1, style: BorderStyle.solid)),
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        if (username.text != "" && password.text != "") {
                          data.login(username.text, password.text, context);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Fill all the credentials");
                        }
                      },
                      child: Container(
                        //height: 50,

                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: Text('LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text('Forgot password?',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: height * .055),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text('Register Here',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),

                  ],
                ),
              ),

            ),
          ),


        ],
      ),
    );
  }
}


