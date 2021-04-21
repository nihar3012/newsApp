import './flutter.dart';
import './Login.dart';
import './Register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterLogin extends StatefulWidget {
  @override
  _RegisterLoginState createState() => _RegisterLoginState();
}

class _RegisterLoginState extends State<RegisterLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'News App',
          style: TextStyle(color: Colors.white,fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(

        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
                width: 150,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  
                ),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => validate()));
                  },
                  
                  elevation: 20,
                  color: Colors.blueGrey[400],
                  textColor: Colors.white,
                  child: Text(
                    'Sign-up',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Container(
                width: 150,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                ),
                // margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: RaisedButton(
                  elevation: 20,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  color: Colors.blueGrey[400],
                  textColor: Colors.white,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
              ],
            ),
            Container(
                width: 200,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: RaisedButton(
                  elevation: 20,
                  onPressed: () => googleSignIn().whenComplete(() =>
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()))),
                  color: Colors.white,
                  textColor: Colors.black,
                  child: Row(
                    children: [
                    Text(
                      'Sign in with Google',
                      style: TextStyle(fontSize: 18),
                    ),
                    ],
                  ),
                )),
          ],
        ),
        padding: EdgeInsets.all(4),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() async {
      if (await FirebaseAuth.instance.currentUser != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }
}
