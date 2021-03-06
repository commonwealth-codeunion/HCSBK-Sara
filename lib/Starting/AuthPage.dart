import 'package:bank/services/auth.dart';
import 'package:bank/App/Pages/MainPage.dart';
import 'package:flutter/material.dart';

import 'RegistrationPage.dart';

class AuthPage extends StatefulWidget {
  final Function toggleView;
  AuthPage({this.toggleView});

  @override
  SignInPage createState() => SignInPage();
}

class SignInPage extends State<AuthPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    //return loading ? Loading() : Scaffold(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF076C6C),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/flash_page/header.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment(-0.7, -0.3),
                  child: Text(
                    'Добро\nпожаловать',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'Почта',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Пароль',
                        ),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:
                                Text('Войти', style: TextStyle(fontSize: 16)),
                            color: Color(0xFFFF4D76),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            onPressed: () async {
                              if (email == "test@mail.ru" &&
                                  password == "12345678") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()),
                                );
                              }
                              // Нахрен flutter
                              // setState(() => loading = true);
                              // dynamic result =
                              //     await _auth.signInWithEmailAndPassword(
                              //         email, password);
                              // if (result == null) {
                              //   setState(() {
                              //     loading = false;
                              //     error =
                              //         'Could not sign in with those credentials';
                              //   });
                              // }

                              // А вот в питоне такого нет

                              // Пиздец, что тут происходит
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 2,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFBFBEBE),
                                ),
                              ),
                              Text(
                                'или',
                                style: TextStyle(fontFamily: 'Montserrat'),
                              ),
                              Container(
                                height: 2,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFBFBEBE),
                                ),
                              ),
                            ],
                          ),
                          // На этом моменте я смело могу пойти вешаться
                          SizedBox(height: 10),
                          OutlineButton(
                            child: Text('Создать аккаунт'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            highlightedBorderColor: Colors.black,
                            padding: const EdgeInsets.all(15),
                            onPressed: () async {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                              // dynamic result = await _auth
                              //     .signInWithEmailAndPassword(email, password);

                              // result == null
                              //     ? print('errror signing in')
                              //     : print('signed in' + result.toString());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
