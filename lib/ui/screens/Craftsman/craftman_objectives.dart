import 'package:craftsman/ui/widgets/custom_flat_button.dart';
import 'package:craftsman/ui/widgets/platform_alert_dialog.dart';
import 'package:craftsman/ui/widgets/platform_button.dart';
import 'package:flutter/material.dart';
import 'package:craftsman/models/MileStones.dart';
import 'package:craftsman/models/Objectives.dart';

class CraftsmanObjectives extends StatefulWidget {
  Milestones milestones;
  CraftsmanObjectives({this.milestones});
  @override
  State<StatefulWidget> createState() => CraftsmanObjectivesState();
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

void _showSubmitDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Confirm"),
        content: new Text("Update Milestone"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("Send"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}




class CraftsmanObjectivesState extends State<CraftsmanObjectives> {
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
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.add_a_photo,color: Colors.grey),
            onPressed: () {
              // _select(choices[0]);
            },
          ),
          IconButton(
            icon: Icon(Icons.check,color: Colors.blue),
            onPressed: () {
              _showSubmitDialog(context);
            },
          ),
        ],
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
        Card(
        elevation: 10,
          child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
              child:
              Text(
                "Uploaded Images",
                style: TextStyle(
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "OpenSans",
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  for(var item in widget.milestones.milestonesImages)
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Image.network(
                        item,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,),
                    ),
                ],
              ),
            ),
          ],
        )
        ),

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
        size: 30.0,
      );
    } else {
      icon = new Icon(
        Icons.radio_button_unchecked,
        color: Colors.blue,
        size: 30.0,
      );
    }
    return new Card(
      elevation: 5,
      child: Container(
        key: ValueKey(objectives.id),
        height: 80.0,
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