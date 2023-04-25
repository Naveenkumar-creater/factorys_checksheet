import 'package:factory_checksheet/login_page.dart';
import 'package:factory_checksheet/machin_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListPage();
          }
          else{
            return LoginPage();
          }
        },
      ),
    );
  }
}
