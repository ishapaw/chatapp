import 'package:chatapp/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 45, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 22,
                      )),
                  SizedBox(
                    width: 85,
                  ),
                  Center(
                    child: Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                        color: Color(0xff131040),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Color(0xffE1E0EB),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Color(0xff131040),
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Notifications",
                        style:
                            TextStyle(color: Color(0xff131040), fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff131040),
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Color(0xffE1E0EB),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.message,
                        color: Color(0xff131040),
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Chat Settings",
                        style:
                            TextStyle(color: Color(0xff131040), fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff131040),
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Color(0xffE1E0EB),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.lock,
                        color: Color(0xff131040),
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Privacy and Security",
                        style:
                            TextStyle(color: Color(0xff131040), fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff131040),
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Color(0xffE1E0EB),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.data_usage,
                        color: Color(0xff131040),
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Storage and data",
                        style:
                            TextStyle(color: Color(0xff131040), fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff131040),
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Color(0xffE1E0EB),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.group,
                        color: Color(0xff131040),
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Invite Friends",
                        style:
                            TextStyle(color: Color(0xff131040), fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff131040),
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Color(0xff131040),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Help',
                    style: TextStyle(
                        color: Color(0xff131040),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Color(0xffE1E0EB),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.question_answer,
                        color: Color(0xff131040),
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Ask",
                        style:
                            TextStyle(color: Color(0xff131040), fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff131040),
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Color(0xffE1E0EB),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.privacy_tip,
                        color: Color(0xff131040),
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Privacy Policy",
                        style:
                            TextStyle(color: Color(0xff131040), fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff131040),
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
