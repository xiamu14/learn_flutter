import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  handleSubmit() {
    print('email field:${emailController.text}');
    print('password field:${passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              'assets/conifer-dancing.png',
              // width: 300,
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                decoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email_outlined,
                      color: (Colors.grey[400])!,
                      size: 26,
                    ),
                    focusColor: (Colors.grey[600]!),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.grey[400]!),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.grey[500]!),
                      ),
                    ),
                    hintText: 'Email ID',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_outlined,
                      color: (Colors.grey[400])!,
                      size: 26,
                    ),
                    focusColor: (Colors.grey[600]!),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.grey[400]!),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.grey[500]!),
                      ),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 113, 233),
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          TextButton(
            onPressed: handleSubmit,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 65, 113, 233),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 400,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Text(
                'OR',
                style: TextStyle(
                    color: (Colors.grey[500])!,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),
              const SizedBox(
                width: 14,
              ),
              Container(
                width: 130,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(110, 214, 224, 235),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 400,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text(
                'Login with Google',
                style: TextStyle(
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New to Logistics?',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 65, 113, 233),
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
