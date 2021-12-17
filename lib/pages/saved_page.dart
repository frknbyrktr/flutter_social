// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_social/data/post_json.dart';
import 'package:flutter_social/theme/colors.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
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
            SizedBox(height: 25),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: List.generate(
                  postsList.length, (index) => getPostContainer(index)),
            )
          ],
        ),
      ),
    );
  }

  Container getPostContainer(int index) {
    var size = (MediaQuery.of(context).size.width - 70) / 2;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(postsList[index]['postImg']),
              fit: BoxFit.cover)),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: primaryLight,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                "Saved",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
