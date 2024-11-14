import "package:flutter/material.dart";
import "package:portfolio_app/pages/contacts.dart";
import "package:portfolio_app/pages/dashboard.dart";
import "package:portfolio_app/pages/login_page.dart";
import "package:portfolio_app/pages/my_work.dart";

import "../pages/about_me.dart";
import "../pages/home.dart";
import "../pages/profile.dart";

Route routeTo(int index, Offset dir) {

  Route route = _toHome(dir);

  switch(index) {
    case 0:
      route = _toDashboard(dir);
      break;
    case 1:
      route = _toHome(dir);
      break;
    case 2:
      route = _toAboutMe(dir);
      break;
    case 3:
      route = _toMyWork(dir);
      break;
    case 4:
      route = _toProfile(dir);
      break;
    case 5:
      route = _toContacts(dir);
      break;
    case 6:
      route = _toLogin(dir);
  }

  return route;
}

Route _toDashboard(Offset dir) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Dashboard(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = dir;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

Route _toHome(Offset dir) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Home(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = dir;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

Route _toAboutMe(Offset dir) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AboutMe(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = dir;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

Route _toMyWork(Offset dir) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const MyWorkPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = dir;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

Route _toProfile(Offset dir) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Profile(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = dir;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

Route _toContacts(Offset dir) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const ContactPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = dir;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

Route _toLogin(Offset dir) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = dir;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}