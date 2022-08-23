import 'package:chatapp/chat_feature/constants.dart';
import 'package:chatapp/chat_feature/database.dart';
import 'package:chatapp/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'conv__screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethod databaseMethod = DatabaseMethod();
  TextEditingController _searchController = TextEditingController();
  bool haveUserSearched = false;

  QuerySnapshot<dynamic>? searchSnapshot;
  initiateSearch() async {
    if (_searchController.text.isNotEmpty) {
      await databaseMethod
          .getUserByUsername(_searchController.text)
          .then((snapshot) {
        searchSnapshot = snapshot;
        setState(() {
          haveUserSearched = true;
        });
      });
    }
  }

  Widget searchList() {
    return haveUserSearched
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: searchSnapshot?.docs.length,
            itemBuilder: (context, index) {
              return SearchTile(
                  userName: searchSnapshot?.docs[index].data()["name"],
                  userEmail: searchSnapshot?.docs[index].data()["email"]);
            })
        : Container();
  }

  createChatRoomAndConverse(String userName) {
    String chatRoomId = getChatRoomId(Constants.myName, userName);

    List<String?> users = [Constants.myName, userName];
    Map<String, dynamic> chatRoomMap = {
      "users": users,
      "chatRoomId": chatRoomId,
    };
    databaseMethod.createChatRoom(chatRoomId, chatRoomMap);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConversationScreen(chatRoomId)));
  }

  Widget SearchTile({required String userName, required String userEmail}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "username: $userName",
                  style: GoogleFonts.firaSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xff131040),
                  ),
                ),
                Text("email: $userEmail",
                    style: GoogleFonts.firaSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xff131040),
                    )),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 35,
            margin: const EdgeInsets.fromLTRB(20, 10, 5, 10),
            child: ElevatedButton(
              onPressed: () {
                createChatRoomAndConverse(userName);
                print("$userName");
              },
              child: Center(
                child: Text(
                  "Message",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black;
                    }
                    return Color(0xff131040);
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
            ),
          )
        ],
      ),
    );
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff131040),
          title: Text(
            'Search',
            style: GoogleFonts.firaSans(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xffE1E0EB),
            ),
          ),
        ),
        body: Container(
            child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    controller: _searchController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "search username",
                        hintStyle: TextStyle(
                          color: Color(0xff6A5C5C),
                        ),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Color(0xffE1E0EB),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    initiateSearch();
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 7,
                )
              ],
            ),
          ),
          searchList(),
        ])));
  }
}
