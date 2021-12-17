// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_social/data/post_json.dart';
import 'package:flutter_social/data/user_json.dart';
import 'package:flutter_social/theme/colors.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryLight,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Social App",
              style: TextStyle(
                fontSize: 18,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesome.bell,
                  color: black,
                  size: 25,
                ))
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Feed",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: const [Colors.red, Colors.blue])),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: black,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: List.generate(usersList.length, (index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(usersList[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(
                  postsList.length, (index) => getCommentStack(index)),
            ),
          ],
        ),
      ),
    );
  }

  Padding getCommentStack(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: Offset(0, 1)),
                ],
                image: DecorationImage(
                    image: NetworkImage(postsList[index]['postImg']),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: black.withOpacity(0.2),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(postsList[index]['img']),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                postsList[index]['name'],
                                style: TextStyle(fontSize: 15, color: white),
                              ),
                              SizedBox(height: 5),
                              Text(
                                postsList[index]['time'],
                                style: TextStyle(
                                    fontSize: 13,
                                    color: white.withOpacity(0.8)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.menu,
                        size: 20,
                        color: white,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getCommentButton(index, "like", FontAwesome.heart),
                      getCommentButton(
                          index, "comment", Icons.chat_bubble_outline),
                      getCommentButton(index, "share", Icons.share),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container getCommentButton(int index, String text, IconData iconData) {
    return Container(
      width: 70,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFFE5E5E5).withOpacity(0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(iconData, color: white, size: 14),
          Text(
            postsList[index][text],
            style: TextStyle(fontSize: 13, color: white.withOpacity(0.9)),
          )
        ],
      ),
    );
  }
}
