import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({
    Key key,
    this.login,
  }) : super(key: key);

  final DocumentReference login;

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController(text: currentUserEmail);
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, -1),
                child: Image.network(
                  'https://picsum.photos/seed/483/300',
                  width: double.infinity,
                  height: 275,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment(0, -0.65),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 34, 0, 12),
                                child: Image.network(
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/flutterflow_assets/ff_logo.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(4, 0, 0, 20),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        List<UsersRecord>
                                            textFieldUsersRecordList =
                                            snapshot.data;
                                        // Customize what your widget looks like with no query results.
                                        if (snapshot.data.isEmpty) {
                                          return Container(
                                            height: 100,
                                            child: Center(
                                              child: Text('No results.'),
                                            ),
                                          );
                                        }
                                        final textFieldUsersRecord =
                                            textFieldUsersRecordList.first;
                                        return Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          child: TextFormField(
                                            controller: emailTextController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Email',
                                              hintStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF455A64),
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF455A64),
                                              fontWeight: FontWeight.normal,
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return 'Field is required';
                                              }

                                              return null;
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(4, 0, 4, 20),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        List<UsersRecord>
                                            textFieldUsersRecordList =
                                            snapshot.data;
                                        // Customize what your widget looks like with no query results.
                                        if (snapshot.data.isEmpty) {
                                          return Container(
                                            height: 100,
                                            child: Center(
                                              child: Text('No results.'),
                                            ),
                                          );
                                        }
                                        final textFieldUsersRecord =
                                            textFieldUsersRecordList.first;
                                        return Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          child: TextFormField(
                                            controller: passwordTextController,
                                            obscureText: !passwordVisibility,
                                            decoration: InputDecoration(
                                              hintText: 'Password',
                                              hintStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                                color: Color(0xFF455A64),
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordVisibility =
                                                      !passwordVisibility,
                                                ),
                                                child: Icon(
                                                  passwordVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  size: 22,
                                                ),
                                              ),
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              color: Color(0xFF455A64),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<UsersRecord> buttonUsersRecordList =
                                        snapshot.data;
                                    // Customize what your widget looks like with no query results.
                                    if (snapshot.data.isEmpty) {
                                      return Container(
                                        height: 100,
                                        child: Center(
                                          child: Text('No results.'),
                                        ),
                                      );
                                    }
                                    final buttonUsersRecord =
                                        buttonUsersRecordList.first;
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (!formKey.currentState
                                              .validate()) {
                                            return;
                                          }
                                          final user = await signInWithEmail(
                                            context,
                                            emailTextController.text,
                                            passwordTextController.text,
                                          );
                                          if (user == null) {
                                            return;
                                          }

                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePageWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                        text: 'Войти',
                                        options: FFButtonOptions(
                                          width: 300,
                                          height: 50,
                                          color: Color(0xFF681A5C),
                                          textStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius: 25,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  'Забыли пароль',
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 12, 0, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: Text(
                                          'У вас нет актуальных аккаунтов?',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFFADADAD),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePageWidget(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Регистрация',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
