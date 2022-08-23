import 'package:chatapp/profile_pic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chatapp/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xffE1E0EB),
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                Center(
                  child: Text(
                    'Profile',
                    style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 300,
                    height: 540,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff131040),
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        ProfilePic(),
                        SizedBox(
                          height: 45,
                        ),
                        // Container(
                        //   height: 55,
                        //   width: 250,
                        //   margin: EdgeInsets.symmetric(horizontal: 10),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.rectangle,
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(10.0),
                        //       ),
                        //       color: Colors.white,
                        //     ),
                        //     child: Center(
                        //       child: Text(e_mai_l!),
                        //     ),
                        //   ),
                        // ),
                        buildTextField("Name", Icons.person),
                        SizedBox(
                          height: 30,
                        ),
                        buildTextField("email", Icons.mail),
                        SizedBox(
                          height: 30,
                        ),
                        buildTextField("Phone", Icons.phone),
                        SizedBox(
                          height: 30,
                        ),
                        buildTextField("About", Icons.info),
                      ],
                    )),
              ]),
            )));
  }

  Widget buildTextField(String placeholder, IconData icon) {
    return Container(
      height: 55,
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.white,
        ),
        child: Center(
          child: TextField(
            cursorColor: Colors.black54,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                icon,
                color: Color(0xff131040),
                size: 24,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                color: Color(0xff6A5C5C),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Container(
// padding: EdgeInsets.all(20),
// decoration: BoxDecoration(
// shape: BoxShape.rectangle,
// borderRadius: BorderRadius.all(
// Radius.circular(10.0),
// ),
// color: Color(0xffF5F6F9),
// ),
// child: Row(
// children: [
// SvgPicture.asset(
// "assets/user.svg",
// width: 22,
// color: Color(0xffF3A888),
// ),
