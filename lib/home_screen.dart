import 'package:chatapp/chat_feature/conv__screen.dart';
import 'package:chatapp/chat_feature/database.dart';
import 'package:chatapp/chat_feature/helper.dart';
import 'package:chatapp/chat_feature/search.dart';
import 'package:chatapp/profile_screen.dart';
import 'package:chatapp/settings.dart';
import 'package:chatapp/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:chatapp/profile_screen.dart';
import 'chat_feature/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? chatRooms;
  DatabaseMethod databaseMethod = DatabaseMethod();

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: (snapshot.data as QuerySnapshot).docs.length,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    userName: (snapshot.data as QuerySnapshot<dynamic>)
                        .docs[0]
                        .data()['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constants.myName, ""),
                    chatRoomId: (snapshot.data as QuerySnapshot<dynamic>)
                        .docs[0]
                        .data()['chatRoomId'],
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  getUserInfo() async {
    Constants.myName = (await HelperFunctions.getuserNameSharePreference())!;

    databaseMethod.getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
      });
    });
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 200,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff131040),
          title: Text(
            'CHATIFY',
            style: GoogleFonts.firaSans(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xffE1E0EB),
            ),
          ),
        ),
        body: Container(
          child: chatRoomsList(),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Color(0xffFFB2A9),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Group 13.png"),
                          ),
                        ),
                      ),
                      Text(
                        "CHATIFY",
                        style: TextStyle(
                          color: Color(0xff131040),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: IconButton(
                  color: Color(0xff131040),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  icon: Icon(Icons.person),
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 16, color: Color(0xff131040)),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.settings),
                  color: Color(0xff131040),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()));
                  },
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(fontSize: 16, color: Color(0xff131040)),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.help),
                  color: Color(0xff131040),
                  onPressed: () {},
                ),
                title: Text(
                  "Help",
                  style: TextStyle(fontSize: 16, color: Color(0xff131040)),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.info),
                  color: Color(0xff131040),
                  onPressed: () {},
                ),
                title: Text(
                  "About us",
                  style: TextStyle(fontSize: 16, color: Color(0xff131040)),
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.logout_rounded),
                  color: Color(0xff131040),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      HelperFunctions.saveuserLoggedInSharePreference(false);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                  },
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 16, color: Color(0xff131040)),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Color(0xffE1E0EB),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
                backgroundColor: Color(0xffE1E0EB),
                color: Color(0xff131040),
                activeColor: Color(0xffE1E0EB),
                tabBackgroundColor: Color(0xff131040),
                gap: 8,
                padding: EdgeInsets.all(16),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: "Home",
                  ),
                  GButton(
                    icon: Icons.search,
                    text: "Search",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: "Settings",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({required this.userName, required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(chatRoomId)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
              color: Color(0xffE1E0EB),
              borderRadius: BorderRadius.circular(13)),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Color(0xff131040),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(userName.substring(0, 1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300)),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(userName,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xff131040),
                      fontSize: 16,
                      fontWeight: FontWeight.w300))
            ],
          ),
        ),
      ),
    );
  }
}
