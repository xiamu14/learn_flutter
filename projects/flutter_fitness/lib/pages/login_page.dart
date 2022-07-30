import 'package:flutter/material.dart';
import 'package:flutter_fitness/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                height: (size.height - 60) * 0.5,
                child: Column(
                  children: const [
                    Text(
                      "Hey there,",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InputWidget(
                      prefixIcon: LineIcons.envelope,
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWidget(
                      prefixIcon: LineIcons.lock,
                      hintText: 'Password',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              // login button and social login
              SizedBox(
                height: (size.height - 60 * 0.5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/root_app',
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [secondary, primary],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  final IconData prefixIcon;
  final String? hintText;

  const InputWidget({
    Key? key,
    this.hintText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgTextField, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Icon(
              prefixIcon,
              color: black,
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: TextField(
                cursorColor: black,
                decoration: InputDecoration(
                    hintText: hintText, border: InputBorder.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}
