import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:portfolio_app/components/custom_button.dart";
import "package:portfolio_app/components/textfield.dart";
import "package:portfolio_app/pages/login_page.dart";
import "package:portfolio_app/services/firestore.dart";
import "package:portfolio_app/util/util.dart";

import "../classes/UserDetails.dart";
import "../global_data.dart";
import "../util/routes.dart";

class SignupPage extends StatefulWidget {

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void createAccount() async {

    String fname = fnameController.text.trim();
    String lname = lnameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;

    userDetails = UserDetails(user?.uid, fname, lname);

    firestoreService.createUserDetails(userDetails);

    Future.delayed(Duration(seconds: 2), () {
      if(context.mounted) {
        Navigator.of(context).pushReplacement(routeTo(0, Offset(-1, 0)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: primaryColor,

        body: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: paddingM, right: paddingM, bottom: paddingM, top: 100),

                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Text(
                        "SIGNUP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Positioned(
                        top: -260 - paddingM,
                        right: -180 - paddingM,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Container(
                                width: 360,
                                height: 360,
                                decoration: const BoxDecoration(
                                    color: Color(0x88ACC8BD),
                                    shape: BoxShape.circle
                                ),
                              ),
                            ),

                            Positioned(
                              top: 130 / 2,
                              left: 130 / 2,
                              child: Container(
                                width: 235,
                                height: 235,
                                decoration: const BoxDecoration(
                                    color: Color(0x88ACC8BD),
                                    shape: BoxShape.circle
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 50, right: 50, top: 72),
                decoration: const BoxDecoration(
                    color: Color(0xffededed),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)
                    )
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create new account!",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    const SizedBox(height: 20,),

                    const Text(
                      "Please fill the details to sign up.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),

                    const SizedBox(height: 20,),

                    CustomTextField(hintText: "First Name", maxLines: 1, controller: fnameController,),
                    const SizedBox(height: 20,),
                    CustomTextField(hintText: "Last Name", maxLines: 1, controller: lnameController),
                    const SizedBox(height: 20,),
                    CustomTextField(hintText: "Email Address", maxLines: 1, controller: emailController),
                    const SizedBox(height: 20,),
                    CustomPassField(hintText: "Password", controller: passwordController),
                    const SizedBox(height: 20,),

                    CustomButton(
                        onPressed: createAccount,
                        content: const Text("SIGN UP", style: TextStyle(
                            color: Colors.white
                        ))
                    ),

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? ", style: TextStyle(fontSize: 14),),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      Offset begin = const Offset(-1, 0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    }
                                )
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 14, color: primaryColor, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
