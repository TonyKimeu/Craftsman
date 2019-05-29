import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftsman/models/Project.dart';
import 'package:craftsman/ui/widgets/platform_button.dart';
import 'package:craftsman/utils/business/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CraftsmanHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CraftsmanHistoryState();
}

final dummySnapshot = [
  {"id": 1,"assignmentTitle": "Bathroom renovation", "companyName": "Tech Factory", "contactPerson":"Antony","phoneNumber":"254720123120", "milestoneCount":5, "milestoneCompleteCount":5,"description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "projectImages": ["https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg","https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"]},
  {"id": 2,"assignmentTitle": "Office Repainting", "companyName": "Tech Factory", "contactPerson":"Alfred","phoneNumber":"254720123120", "milestoneCount":7, "milestoneCompleteCount":7,"description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "projectImages": ["https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg","https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"]},
  {"id": 3,"assignmentTitle": "Livingroom Furnishing", "companyName": "Tech Factory", "contactPerson":"Marc","phoneNumber":"254720123120", "milestoneCount":6, "milestoneCompleteCount":6,"description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "projectImages": ["https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg","https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"]},
  {"id": 4,"assignmentTitle": "Bedroom Repainting", "companyName": "Tech Factory", "contactPerson":"Nelson","phoneNumber":"254720123120", "milestoneCount":5, "milestoneCompleteCount":5,"description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "projectImages": ["https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg","https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"]},
  {"id": 5,"assignmentTitle": "Flooring", "companyName": "Tech Factory", "contactPerson":"Simon","phoneNumber":"254720123120", "milestoneCount":5, "milestoneCompleteCount":5,"description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "projectImages": ["https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg","https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"]},
  {"id": 6,"assignmentTitle": "Kitchen Cabinetry", "companyName": "Tech Factory", "contactPerson":"Tim","phoneNumber":"254720123120", "milestoneCount":10, "milestoneCompleteCount":10,"description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "projectImages": ["https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg","https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"]},
  {"id": 7,"assignmentTitle": "Finishing", "companyName": "Tech Factory", "contactPerson":"Luis","phoneNumber":"254720123120", "milestoneCount":5, "milestoneCompleteCount":5,"description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "projectImages": ["https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg","https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg","https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"]}

];

class CraftsmanHistoryState extends State<CraftsmanHistory> {
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
    final record = Project.fromMap(data);
    double percentage = record.milestoneCompleteCount * 100/ record.milestoneCount;

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
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 200,
                          animation: true,
                          lineHeight: 7.0,
                          animationDuration: 2000,
                          percent: percentage/100.0,
                          center: Text(
                            percentage.toInt().toString()+"%",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.blue,
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
          /*trailing:  Column(
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
          ),*/
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
