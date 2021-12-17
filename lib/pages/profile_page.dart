// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_social/data/me_post_json.dart';
import 'package:flutter_social/theme/colors.dart';
import 'package:video_player/video_player.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late VideoPlayerController _controller;

  bool isPhoto = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(180),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getCountColumn("Posts", "35"),
              getCountColumn("Followers", "3,820"),
              getCountColumn("Follow", "258"),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      isPhoto = true;
                    });
                  },
                  icon: Icon(Icons.photo,
                      size: 25, color: isPhoto ? primary : black)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isPhoto = false;
                    });
                  },
                  icon: Icon(
                    Icons.video_camera_back,
                    size: 25,
                    color: !isPhoto ? primary : black,
                  ))
            ],
          ),
          SizedBox(height: 30),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: isPhoto
                ? List.generate(
                    mePostList.length, (index) => getMinePostList(index))
                : List.generate(
                    meVideoList.length, (index) => getMineVideoList(index)),
          )
        ],
      ),
    );
  }

  Widget getMinePostList(int index) {
    var size = (MediaQuery.of(context).size.width - 60) / 2;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(mePostList[index]), fit: BoxFit.cover),
      ),
    );
  }

  Widget getMineVideoList(int index) {
    var size = (MediaQuery.of(context).size.width - 60) / 2;
    return GestureDetector(
      onTap: () {
        playVideo(context, meVideoList[index]["videoUrl"]);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(meVideoList[index]['img']),
                fit: BoxFit.cover)),
        child: Center(
          child: Icon(Icons.play_circle_outline, size: 40, color: white),
        ),
      ),
    );
  }

  playVideo(BuildContext context, videoUrl) {
    _controller = VideoPlayerController.network(videoUrl);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ));
  }

  Column getCountColumn(String header, String count) {
    return Column(
      children: [
        Text(header, style: TextStyle(fontSize: 15, color: black)),
        SizedBox(height: 5),
        Text(
          count,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryLight,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getPhotoContainer(
                "https://images.pexels.com/photos/8579209/pexels-photo-8579209.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
            SizedBox(height: 10),
            Text(
              "frknbyrktr",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "@frknbyrktr",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Container getPhotoContainer(String url) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: black)),
      child: Center(
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
