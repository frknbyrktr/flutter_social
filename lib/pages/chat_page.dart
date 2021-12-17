// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_social/data/user_json.dart';
import 'package:flutter_social/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          getSearchContainer(),
          SizedBox(height: 40),
          Column(
            children: List.generate(
                usersList.length, (index) => getChatContainer(index)),
          ),
        ],
      ),
    ));
  }

  Container getChatContainer(int index) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 1),
          )
        ],
        color: white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          getPhotoContainer(usersList[index]['img']),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  usersList[index]['name'],
                  style: TextStyle(fontSize: 15, color: black),
                ),
                SizedBox(height: 5),
                Text(
                  usersList[index]['message'],
                  style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container getPhotoContainer(String url) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: black)),
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Container getSearchContainer() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(0, 1),
            )
          ]),
      child: Row(
        children: [
          SizedBox(width: 5),
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: black)),
          SizedBox(width: 5),
          Flexible(
            child: TextField(
                cursorColor: black,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search")),
          ),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryLight,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Messages",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
