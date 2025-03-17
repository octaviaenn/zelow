import 'package:flutter/material.dart';
import 'package:zelow/components/constant.dart';

import '../../services/auth_service.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({super.key});

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  void _handleLogout() {
    AuthService().logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text("Home Page User", style: TextStyle(color: black)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _handleLogout,
            icon: Icon(Icons.logout, color: black),
          ),
        ],
      ),
    );
  }
}
