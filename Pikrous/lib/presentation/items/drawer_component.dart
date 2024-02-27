// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pikrous/helper/utils/preference.dart';
import 'package:pikrous/presentation/pages/auth/login_page.dart';
// import 'package:pikrous/presentation/pages/doctors/become_doctor.dart';
import 'package:pikrous/presentation/pages/faqs_page.dart';
import 'package:pikrous/presentation/pages/your_account_page.dart';
import 'package:pikrous/presentation/pages/favorites_page.dart';

import '../../helper/utils/colors.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

showLogoutDialog(context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Logout'), // Use widget.title here
        content: const Text("Are you sure you want to logout?"),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () {
              AppPreference.clearSaveAccess();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

class _DrawerComponentState extends State<DrawerComponent> {

  bool isDarkTheme = false; // Define isDarkTheme here
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const YourAccountPage()));
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Your Account')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritePage(),
              ),
            );
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('About Us')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaqsPage(),
                  ),
                );                
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.question_answer,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('FAQs')
              ],
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            AppPreference.clearSaveAccess();
            AppPreference.clearUserData();
            showLogoutDialog(context);
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0XFFF808080), width: 2.0),
              ),
            ),
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: primaryColor.withOpacity(0.63),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Logout')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}