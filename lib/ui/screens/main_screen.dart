import 'package:flutter/material.dart';
import 'package:craftsman/utils/business/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:craftsman/models/user.dart';

import 'Craftsman/craftsman_navigation.dart';
import 'Customer/customer_navigation.dart';

class MainScreen extends StatefulWidget {
  final FirebaseUser firebaseUser;

  MainScreen({this.firebaseUser});

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print(widget.firebaseUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //NavDrawer
      /*appBar: new AppBar(
        elevation: 0.5,
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        title: Text("Home"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                _logOut();
                _scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
      ),*/
      body: StreamBuilder(
        stream: Auth.getUser(widget.firebaseUser.uid),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                  Color.fromRGBO(212, 20, 15, 1.0),
                ),
              ),
            );
          } else {
            if(snapshot.data.role == "customer"){
              return new CustomerNavigation(
              );

            } else if (snapshot.data.role == "craftsman"){
              return new CraftsmanNavigation();
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      child: CircleAvatar(
                        backgroundImage: (snapshot.data.profilePictureURL != '')
                            ? NetworkImage(snapshot.data.profilePictureURL)
                            : AssetImage("assets/images/default.png"),
                      ),
                    ),
                    Text("Name: ${snapshot.data.userName}"),
                    Text("Email: ${snapshot.data.email}"),
                    Text("Phone: ${snapshot.data.phone}"),
                    Text("Role: ${snapshot.data.role}"),
                    Text("UID: ${snapshot.data.userID}"),
                  ],
                ),
              );

            }

          }
        },
      ),
    );
  }

  void _logOut() async {
    Auth.signOut();
  }
}
