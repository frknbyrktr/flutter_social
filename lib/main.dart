// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_social/pages/chat_page.dart';
import 'package:flutter_social/pages/home_page.dart';
import 'package:flutter_social/pages/profile_page.dart';
import 'package:flutter_social/pages/saved_page.dart';
import 'package:flutter_social/theme/colors.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 1),
          ),
        ],
        color: primaryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 0;
                });
              },
              child: Icon(
                FontAwesome.home,
                size: 25,
                color: (activeTab == 0 ? primary : black),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
              child: Icon(
                FontAwesome.chat,
                size: 25,
                color: (activeTab == 1 ? primary : black),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 2;
                });
              },
              child: Icon(
                FontAwesome.heart,
                size: 25,
                color: (activeTab == 2 ? primary : black),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 3;
                });
              },
              child: Icon(
                Icons.account_circle,
                size: 25,
                color: (activeTab == 3 ? primary : black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ChatPage(),
        SavedPage(),
        ProfilePage(),
      ],
    );
  }
}
