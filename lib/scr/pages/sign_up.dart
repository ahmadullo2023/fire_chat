import 'package:fire_chat/scr/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../service/auth.dart';
import '../view/coustom_eleveted_button.dart';
import '../view/coustom_text_field.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey2 = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 32, 45),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "REGISTRATION",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Welcome back! Glad to see you",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    hintText: "your name",
                    validator: (p0) =>
                        Provider.of<ProFunc>(context, listen: false).nameUp(p0),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: email,
                    hintText: "your email",
                    validator: (p0) =>
                        Provider.of<ProFunc>(context, listen: false)
                            .emailIn(p0),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: password,
                    hintText: "your password",
                    validator: (p0) =>
                        Provider.of<ProFunc>(context, listen: false)
                            .passwordIn(p0),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: password,
                    hintText: "your password",
                    validator: (p0) =>
                        Provider.of<ProFunc>(context, listen: false)
                            .passwordIn(p0),
                  ),
                  const SizedBox(height: 30),
                  CustomElevatedButton(
                    text: "Login",
                    onPressed: () {
                      if (_formKey2.currentState!.validate()) {
                        createUserWithEmailAndPassword();
                      }
                    },
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const SignIn(),
                        ),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "Don't have an account?",
                            ),
                            TextSpan(
                              text: " SingIn now",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword() async {
    await Auth()
        .signUp(
          email: email.text,
          password: password.text,
        )
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ),
          ),
        );
  }
}
