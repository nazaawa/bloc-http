import 'package:bloc_exercice/src/bloc/bloc.dart';
import 'package:bloc_exercice/src/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color couleur = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 30,
        ),
        child: ListView(
          children: [
            // entete
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(),
                    child: Icon(
                      Icons.arrow_back_ios,
                    )),
                Text(
                  "Log in",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 80),
            /*     Text('Log in with one of the following options',
                style: TextStyle(color: Colors.white)),
// */
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child:
                              FaIcon(FontAwesomeIcons.apple, color: couleur)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: StreamBuilder(
                        stream: bloc.email,
                        builder: (context, AsyncSnapshot<String> snapshot) {
                          return TextFormField(
                            onChanged: bloc.changeEmail,
                            style: TextStyle(color: couleur),
                            decoration: InputDecoration(
                                errorText: snapshot.error != null
                                    ? ''
                                    : snapshot.error.toString(),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.orange, width: 2.0),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ))),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("password",
                      style: TextStyle(
                        color: couleur,
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: StreamBuilder(
                        stream: bloc.password,
                        builder: (context, snapshot) {
                          return TextFormField(
                            onChanged: bloc.changePassword,
                            style: TextStyle(color: couleur),
                            decoration: InputDecoration(
                                errorText: snapshot.error != null
                                    ? snapshot.error.toString()
                                    : '',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.orange, width: 2.0),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ))),
                          );
                        }),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: bloc.submitValid,
                builder: (context, snapshot) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.pink),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 160, vertical: 20))),
                        onPressed: () {
                          if (snapshot.hasData) {
                            bloc.submit();
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Homem();
                            }));
                          }return null;
                        },
                        child: Text("Log In")),
                  );
                }),
       
          ],
        ),
      ),
    );
  }
}
