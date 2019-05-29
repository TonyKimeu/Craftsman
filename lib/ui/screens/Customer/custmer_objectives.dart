import 'package:craftsman/models/MileStones.dart';
import 'package:craftsman/models/Objectives.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerObjectives extends StatefulWidget {
  Milestones milestones;
  CustomerObjectives({this.milestones});
  @override
  State<StatefulWidget> createState() => CustomerObjectivesState();
}

final objectivesData = [
  {"id": 1,"milestoneId": 1, "title": "Objective 1", "assignedName":"Antony",
    "assignedPic":"https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona-810x810.jpg",
    "completed":true,
  },
  {"id": 2,"milestoneId": 1, "title": "Objective 2", "assignedName":"Antony",
    "assignedPic":"https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona-810x810.jpg",
    "completed":true,
  },
  {"id": 3,"milestoneId": 1, "title": "Objective 3", "assignedName":"Antony",
    "assignedPic":"https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona-810x810.jpg",
    "completed":true,
  },
  {"id": 4,"milestoneId": 1, "title": "Objective 4", "assignedName":"Antony",
    "assignedPic":"https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona-810x810.jpg",
    "completed":false,
  },
  {"id": 5,"milestoneId": 1, "title": "Objective 5", "assignedName":"Antony",
    "assignedPic":"https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona-810x810.jpg",
    "completed":false,
  },
];

class CustomerObjectivesState extends State<CustomerObjectives> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build customer history
    return Scaffold(
      //Toolbar
      appBar: AppBar(
        title: Text(widget.milestones.title,
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
            fontFamily: "OpenSans",
          ),
        ),
        centerTitle: true,
      ),
      //Body
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return _buildList(context, objectivesData );
  }

  //Objectives List
  Widget _buildList(BuildContext context, List<Map> snapshot) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 0.0),
            children: snapshot.map((data)=> _buildListItem(context, data)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, Map data) {
    final objectives = Objectives.fromMap(data);
    Icon icon;
    if (objectives.completed) {
      icon = new Icon(
        Icons.check_circle,
        color: Colors.blue,
        size: 20.0,
      );
    } else {
      icon = new Icon(
        Icons.radio_button_unchecked,
        color: Colors.blue,
        size: 20.0,
      );
    }
    return new Card(
      elevation: 5,
      child: Container(
        key: ValueKey(objectives.id),
        height: 100.0,
        margin: const EdgeInsets.only(left: 10.0),
        child: ListTile(
          //Card Icon
          leading:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: ClipOval(
                                child: Image.network(
                                  objectives.assignedPic,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.contain,
                                ),
                              ),

                            )
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
          //Card Title
          title:
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Container(
              child:
              Text(
                objectives.title,
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
          //Card Content
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
                            "Assigned To: "+objectives.assignedName,
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
                            "End Date: 12/6/2019",
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
                ),
              )
            ],
          ),
          //Card End
          trailing:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                child: icon
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}