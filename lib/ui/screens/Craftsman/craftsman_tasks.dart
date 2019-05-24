import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsman/ui/widgets/platform_button.dart';
import 'package:craftsman/utils/business/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CraftsmanTasks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CraftsmanTasksState();
}


final dummySnapshot = [
  {"id": 1,"assignmentTitle": "Bathroom renovation", "companyName": "Tech Factory", "contactPerson":"Antony Kimeu","phoneNumber":"254720123120", "milestoneCount":5},
  {"id": 2,"assignmentTitle": "Office Repainting", "companyName": "Tech Factory", "contactPerson":"Alfred Kiguru","phoneNumber":"254720123120", "milestoneCount":5},
  {"id": 3,"assignmentTitle": "Office Repainting", "companyName": "Tech Factory", "contactPerson":"Alfred Kiguru","phoneNumber":"254720123120", "milestoneCount":5},
  {"id": 4,"assignmentTitle": "Office Repainting", "companyName": "Tech Factory", "contactPerson":"Alfred Kiguru","phoneNumber":"254720123120", "milestoneCount":5},
  {"id": 5,"assignmentTitle": "Office Repainting", "companyName": "Tech Factory", "contactPerson":"Alfred Kiguru","phoneNumber":"254720123120", "milestoneCount":5},
  {"id": 6,"assignmentTitle": "Office Repainting", "companyName": "Tech Factory", "contactPerson":"Alfred Kiguru","phoneNumber":"254720123120", "milestoneCount":5},
  {"id": 7,"assignmentTitle": "Office Repainting", "companyName": "Tech Factory", "contactPerson":"Alfred Kiguru","phoneNumber":"254720123120", "milestoneCount":5},
];


class CraftsmanTasksState extends State<CraftsmanTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks',
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
            fontFamily: "OpenSans",
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.blue),
            onPressed: () {
              // _select(choices[0]);
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app,color: Colors.blue),
            onPressed: () {
              _logOut();
            },
          ),
        ],
      ),

      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return _buildList(context, dummySnapshot);
  }

  Widget _buildList(BuildContext context, List<Map> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 0.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),

    );
  }

  Widget _buildListItem(BuildContext context, Map data) {
    final record = Record.fromMap(data);

    return new Card(
      elevation: 5,
      child: Container(
        key: ValueKey(record.id),
        height: 100.0,

        margin: const EdgeInsets.only(left: 10.0),
        child: ListTile(
          //Card Icon
          leading:  ClipOval(
            child: Image.network(
              'http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg',
              width: 55,
              height: 55,
              fit: BoxFit.contain,
            ),
          ),
          //Card Title
          title:
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Container(
              child: Text(
                record.assignmentTitle,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "OpenSans",
                ),
              ),

            ),
          ),
          //Content
          subtitle :  Row(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          child: Text(
                            "Company: "+record.companyName,
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 54),
                              decoration: TextDecoration.none,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          child: Text(
                            "Contact: "+record.contactPerson,
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 54),
                              decoration: TextDecoration.none,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "OpenSans",
                            ),
                          ),


                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          child: Text(
                            "Phone Number: "+record.phoneNumber,
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 54),
                              decoration: TextDecoration.none,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "OpenSans",
                            ),
                          ),


                        ),
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
          trailing:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  child: Text(
                    "2/"+record.milestoneCount.toString(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 54),
                      decoration: TextDecoration.none,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ),
              ),

            ],
          ),
          //Onclick
          onTap: () => print(record),
        ),
      ),
    );


  }
  void _logOut() async {
    Auth.signOut();
  }
}

class Record {
  final String assignmentTitle,companyName,contactPerson,phoneNumber;
  final int id, milestoneCount;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['assignmentTitle'] != null),
        assert(map['companyName'] != null),
        assert(map['contactPerson'] != null),
        assert(map['phoneNumber'] != null),
        assert(map['milestoneCount'] != null),
        id = map['id'],
        assignmentTitle = map['assignmentTitle'],
        companyName = map['companyName'],
        contactPerson = map['contactPerson'],
        phoneNumber = map['phoneNumber'],
        milestoneCount = map['milestoneCount'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$id:$assignmentTitle:$companyName:$contactPerson:$phoneNumber:$milestoneCount>";


}