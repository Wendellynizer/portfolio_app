import 'package:flutter/material.dart';
import 'package:portfolio_app/util/util.dart';

import '../components/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  TextEditingController textController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  TextEditingController encryptedController = TextEditingController();

  String _caesarCipher(String text, int shift) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) {
        // Uppercase letters
        result.writeCharCode((charCode - 65 + shift) % 26 + 65);
      } else if (charCode >= 97 && charCode <= 122) {
        // Lowercase letters
        result.writeCharCode((charCode - 97 + shift) % 26 + 97);
      } else {
        // Non-alphabetic characters remain unchanged
        result.writeCharCode(charCode);
      }
    }
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        )),
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

        backgroundColor: primaryColor,
        elevation: 0,
      ),

      drawer: const CustomDrawer(pageIndex: 0),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),

        child: ListView(
          children: [
            Card(title: "Caesar Cipher"),

            const SizedBox(height: 20,),

            Card(title: "Atbash Cipher"),

            const SizedBox(height: 20,),

            Card(title: "Vinegere Cipher"),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  
  final title;
  
  const Card({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),

          SizedBox(height: 10,),

          CipherField(hintText: "Encrypted Value", editable: true,),

          SizedBox(height: 10,),

          CipherField(hintText: "Encrypted Value", editable: false,),

          SizedBox(height: 10,),

          
          Flex(

            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {},
                color: primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),

                child: Text("ENCRYPT", style: TextStyle(color: Colors.white),),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CipherField extends StatelessWidget {

  final hintText;
  final editable;
  // final controller;

  const CipherField({super.key, required this.hintText, required this.editable});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,

      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hintText,
          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true,
          enabled: editable
      ),
    );
  }
}

