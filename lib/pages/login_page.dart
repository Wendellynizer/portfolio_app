import "dart:developer";

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:portfolio_app/classes/UserDetails.dart";
import "package:portfolio_app/components/custom_button.dart";
import "package:portfolio_app/components/textfield.dart";
import "package:portfolio_app/global_data.dart";
import "package:portfolio_app/pages/sign_up_page.dart";
import "package:portfolio_app/util/routes.dart";
import "package:portfolio_app/util/util.dart";
import "package:portfolio_app/services/firestore.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final GoogleSignIn googleSignIn = GoogleSignIn();

    void logIn(String email, String password) async {

      String message = '';
      try {
        // enter credentials to firebase auth
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password
        );

        String? uid = FirebaseAuth.instance.currentUser?.uid;

        Map<String, dynamic> uData = await FirestoreService().getUserDetails(uid);

        userDetails = UserDetails(uid, uData["f_name:"], uData["l_name"]);

        // push to dashboard page
        Future.delayed(const Duration(seconds: 2),  () {
          // print('oks kana boi');

          if(context.mounted) {
            Navigator.of(context).pushReplacement(routeTo(0, Offset(1, 0)));
          }
        });

      }  on FirebaseAuthException catch(e) {
        //  show error message
        if(e.code == 'INVALID_LOGIN_CREDENTIALS') {
          message = 'Invalid credentials';
        }
      }
    }

    Future<void> signInWithGoogle() async {
      try {
        await GoogleSignIn().signOut(); // sign out any user

        final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        String? fullName = user?.displayName;

        List<String>? names = fullName?.split(' ');

        userDetails = UserDetails(user?.uid, names?.elementAt(0), names?.elementAt(1));

        Future.delayed(Duration(seconds: 2), () {
          if(context.mounted) {
            Navigator.of(context).pushReplacement(routeTo(0, Offset(-1, 0)));
          }
        });

      } on FirebaseAuthException catch(e) {
        print(e.message);
        return;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,

      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: paddingM, right: paddingM, bottom: paddingM, top: 100),

                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Text(
                      "LOGIN",
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
                      "Hi There!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                  ),

                  const SizedBox(height: 20,),

                  const Text(
                    "Please enter your credentials.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),

                  const SizedBox(height: 20,),

                  CustomTextField(hintText: "Email Address", maxLines: 1, controller: emailController),
                  const SizedBox(height: 20,),
                  CustomPassField(hintText: "Password", controller: passwordController,),
                  const SizedBox(height: 20,),

                  CustomButton(
                      onPressed: ()  => logIn(emailController.text,  passwordController.text),
                      content: const Text("LOGIN", style: TextStyle(
                        color: Colors.white
                      ))
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ", style: TextStyle(fontSize: 14),),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => const SignupPage(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    Offset begin = const Offset(1, 0);
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
                          "Sign up",
                          style: TextStyle(fontSize: 14, color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 64,),

                  const Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("or")
                    ],
                  ),
                  const SizedBox(height: 20,),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () => signInWithGoogle(),
                          color: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),


                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('lib/images/google.webp'), width: 30,),
                              SizedBox(width: 10,),
                              Text("Continue with Google", style: TextStyle(fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
