import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:portfolio_app/global_data.dart";
import "package:portfolio_app/services/firestore.dart";
import "package:portfolio_app/util/util.dart";

import "../util/routes.dart";

class CustomDrawer extends StatefulWidget {
  final int pageIndex;

  const CustomDrawer({super.key, required this.pageIndex});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {


    List listLinks = [
      [Icons.dashboard_rounded, "Dashboard"],
      [Icons.home_rounded, "Home"],
      [Icons.info_rounded, "About Me"],
      [Icons.devices_rounded, "My Works"],
      [Icons.person_2_rounded, "Profile"],
      [Icons.phone_rounded, "Contact"],
      [Icons.logout_rounded, "Logout"],
    ];

    void signOut() async {
      try {
        // signout using firebase
        await FirebaseAuth.instance.signOut();
        
        Future.delayed(Duration(seconds: 2), (){
          if(context.mounted) {
            Navigator.of(context).pushReplacement(routeTo(6, Offset(1, 0)));
          }
        });
      } on FirebaseAuthException catch(e) {
        print(e.message);
      }
    }
    
    Color getTextColor(currentIndex, tileIndex) {
      Color color = Colors.black87;
      if(tileIndex == currentIndex) {
        return Colors.white;
      } else if(tileIndex == 6) {
        return Colors.red;
      }

      return color;
    }

    String? getUserEmail()  {
      String? email = FirebaseAuth.instance.currentUser?.email;

      return email;
    }
    
    
    return Drawer(
      shape: Border.all(
          width: 0
      ),

      child: Column(
        children: [
          // name and email container
          Container(
            decoration: const BoxDecoration(
              color: highlightColor,
            ),

            child: Padding(
              padding: const EdgeInsets.only(left:  paddingM, right: paddingM, top: 60, bottom: paddingM),
              child: Row(

                children: [
                  // image
                  const Image(image: AssetImage('lib/images/user.png'), width: 52,),

                  const SizedBox(width: 20,),
                  // user info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userDetails!.getFullName(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      ),
                      Text(
                          getUserEmail().toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0x99FFFFFF),
                          )
                      )
                    ],
                  )
                ],
              ),
            )
          ),

         Expanded (
           child: ListView.builder(
             itemCount: listLinks.length,
             itemBuilder: (context, index) {
               return ListTile(

                 selectedColor: Colors.yellow,
                 tileColor: (widget.pageIndex == index) ? primaryColor : Colors.transparent,
                 onTap: () {

                   // sign out if index is 6 (logout tile)
                   if(index == 6) {
                     signOut();
                     return;
                   }

                   if(!(widget.pageIndex == index)) {
                     Navigator.of(context).pushReplacement(routeTo(index, const Offset(-1, 0)));
                   }
                 },

                 leading: Icon(
                   listLinks[index][0],
                   color: getTextColor(widget.pageIndex, index),
                 ),
                 title: Text(
                   listLinks[index][1],
                   style: TextStyle(
                     fontWeight: FontWeight.w500,
                     color: getTextColor(widget.pageIndex, index),
                   ),
                 ),
               );
             },
           ),
         ),
        ],
      ),
    );
  }
}


