import "package:flutter/material.dart";
import "package:portfolio_app/components/custom_button.dart";
import "package:portfolio_app/components/textfield.dart";
import "package:portfolio_app/util/util.dart";

import "../components/drawer.dart";
import "../util/routes.dart";

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});



  @override
  Widget build(BuildContext context) {
    final TextEditingController dummy = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (context) =>
              MaterialButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },

                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.menu,
                    size: 28,
                  )
              ),
        ),

        title: const  Text("CONTACTS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),

        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
      ),

      backgroundColor: secondaryColor,

      drawer: const CustomDrawer(pageIndex: 5),

      body: Padding(
        padding: const EdgeInsets.only(left: paddingM, right: paddingM),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Have a Question for Wendel Sabelo?",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),

                  const SizedBox(height: 50,),

                  CustomTextField(hintText: 'First Name', maxLines: 1, controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  CustomTextField(hintText: 'Last Name', maxLines: 1, controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  CustomTextField(hintText: 'Message', maxLines: 10, controller: TextEditingController()),
                  const SizedBox(height: 20,),
                  CustomButton(
                      onPressed: () {}, 
                      content: const Text(
                        "SEND",
                        style: TextStyle(color: Colors.white),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
