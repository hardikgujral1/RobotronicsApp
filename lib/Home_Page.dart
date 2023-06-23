import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.home)),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(CupertinoIcons.ellipsis_vertical)),
        ],
        backgroundColor: Colors.deepPurple[400],
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Chat",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 30,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.add,
                size: 30,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: 11,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 5),
          itemBuilder: (context, index) {
            return Chats();
          }),
    );
  }
}

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(
            "User",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Last message",
            style: TextStyle(color: Colors.black54),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/chat.png"),
          ),
          trailing: Text(
            "12:00 p.m",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
