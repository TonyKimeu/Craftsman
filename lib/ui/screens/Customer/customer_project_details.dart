import 'package:craftsman/models/MileStones.dart';
import 'package:craftsman/models/Objectives.dart';
import 'package:craftsman/models/Project.dart';
import 'package:craftsman/ui/widgets/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:craftsman/ui/widgets/CheckboxProgress.dart';

import 'custmer_objectives.dart';

class CustomerProjectDetails extends StatefulWidget {
   Project project;
  CustomerProjectDetails({this.project});

   final _foldingCellKey = new GlobalKey<SimpleFoldingCellState>();

  @override
  State<StatefulWidget> createState() => CustomerProjectDetailsState();
}

final milestoneData = [
  {"id": 1,
    "projectId": 1,
    "title": "MileStone 1",
    "completed":true,
    "milestonesImages": [
      "https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg",
      "https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"
    ],
  },

  {"id": 2,
    "projectId": 2,
    "title": "MileStone 2",
    "completed":true,
    "milestonesImages": [
      "https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg",
      "https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"
    ],
  },

  {"id": 3,
    "projectId": 3,
    "title": "MileStone 3",
    "completed":true,
    "milestonesImages": [
      "https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg",
      "https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"
    ],
  },

  {"id": 4,
    "projectId": 4,
    "title": "MileStone 4",
    "completed":true,
    "milestonesImages": [
      "https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg",
      "https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"
    ],
  },

  {"id": 5,
    "projectId": 5,
    "title": "MileStone 5",
    "completed":false,
    "milestonesImages": [
      "https://www.magnonindia.com/wp-content/uploads/2018/10/kitchen-a3.jpg",
      "https://4.imimg.com/data4/TY/JP/MY-9293913/modular-kitchen-interior-designing-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg",
      "https://3.imimg.com/data3/HU/AW/MY-6756431/kitchen-furniture-500x500.jpg"
    ],
  },

];



class CustomerProjectDetailsState extends State<CustomerProjectDetails> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build customer history
    return Scaffold(
      //Toolbar
      appBar: AppBar(
        title: Text(widget.project.assignmentTitle,
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
            icon: Icon(Icons.message, color: Colors.blue),
            onPressed: () {
              // _select(choices[0]);
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
    return _buildList(context, milestoneData );
  }

  //Objectives List
  Widget _buildList(BuildContext context, List<Map> snapshot) {
    return Column(
      children: <Widget>[
        Column(
          children: [
            //Top Body: Project Details
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: SimpleFoldingCell(
                    key: widget._foldingCellKey,
                    frontWidget: _buildFrontWidget(),
                    innerTopWidget: _buildInnerTopWidget(),
                    innerBottomWidget: _buildInnerBottomWidget(),
                    cellSize: Size(MediaQuery
                        .of(context)
                        .size
                        .width, 127
                    ),
                    padding: EdgeInsets.all(0),
                    animationDuration: Duration(milliseconds: 300),
                    borderRadius: 10,
                    onOpen: () => print('cell opened'),
                    onClose: () => print('cell closed')),
              ),
            ),
            //Bottom Body: Objectives List

          ],
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
    final milestones = Milestones.fromMap(data);
    return
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          key: ValueKey(milestones.id),
          color: Colors.white,
          child:
          new SimpleFoldingCell(
              frontWidget: _buildFrontObjectiveWidget(milestones),
              innerTopWidget: _buildInnerTopObjectiveWidget(milestones),
              innerBottomWidget: _buildInnerBottomObjectiveWidget(milestones),
              cellSize: Size(MediaQuery.of(context).size.width, 85),
              animationDuration: Duration(milliseconds: 300),
              onOpen: () => print(' cell opened'),
              onClose: () => print(' cell closed')),

        ),
      );
  }

  //Foldable Card
  //Project
  Widget _buildFrontWidget() {
    double percentage = widget.project.milestoneCompleteCount * 100/ widget.project.milestoneCount;
    return Container(
        color: Colors.white,
        //alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Card(
              elevation: 0,
              child: Container(
                key: ValueKey(widget.project.id),
                height: 117.0,
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
                                    child: CircularPercentIndicator(
                                      radius: 50.0,
                                      lineWidth: 3.0,
                                      percent: percentage.toInt()/100,
                                      /*center: ClipOval(
                              child: Image.network(
                                'http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),*/
                                      center: new Text(
                                        percentage.toInt().toString()+"%",
                                        style:
                                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                      ),
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.blue,

                                    )
                                ),
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
                        widget.project.assignmentTitle,
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
                                    "Company: "+widget.project.companyName,
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
                                    "Contact: "+widget.project.contactPerson,
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
                                    "Phone Number: "+widget.project.phoneNumber,
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
                              /*Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 167,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: 0.8,
                        center: Text("80.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.blue,
                      ),
                    ),*/
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: new CheckboxProgress(
                                  starCount : widget.project.milestoneCount,
                                  rating: widget.project.milestoneCompleteCount.toDouble(),
                                  //onRatingChanged: (rating) => setState(() => this.ratingx = rating),
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
                          child: new IconButton(
                            icon: Icon(
                              Icons.arrow_left,
                              color: Colors.blue,
                              size: 40,
                            ),
                            onPressed: () {
                              widget._foldingCellKey?.currentState?.toggleFold();
                            },
                          ),

                        ),
                      ),
                    ],
                  ),

                  onTap: () {
                    widget._foldingCellKey?.currentState?.toggleFold();
                  },

                ),
              ),
            ),

            /*  Text("CARD",
                style: TextStyle(
                    color: Color(0xFF2e282a),
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800)),
            FlatButton(
              onPressed: () => widget._foldingCellKey?.currentState?.toggleFold(),
              child: Text(
                "Open",
              ),
              textColor: Colors.white,
              color: Colors.indigoAccent,
              splashColor: Colors.white.withOpacity(0.5),
            )*/
          ],
        ));
  }

  Widget _buildInnerTopWidget() {
    double percentage = widget.project.milestoneCompleteCount * 100/ widget.project.milestoneCount;
    return Container(
        color: Colors.white,
        //alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Card(
              elevation: 0,
              child: Container(
                key: ValueKey(widget.project.id),
                height: 117.0,
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
                                    child: CircularPercentIndicator(
                                      radius: 50.0,
                                      lineWidth: 3.0,
                                      percent: percentage.toInt()/100,
                                      /*center: ClipOval(
                              child: Image.network(
                                'http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),*/
                                      center: new Text(
                                        percentage.toInt().toString()+"%",
                                        style:
                                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                                      ),
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.blue,

                                    )
                                ),
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
                        widget.project.assignmentTitle,
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
                                    "Company: "+widget.project.companyName,
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
                                    "Contact: "+widget.project.contactPerson,
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
                                    "Phone Number: "+widget.project.phoneNumber,
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
                              /*Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 167,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: 0.8,
                        center: Text("80.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.blue,
                      ),
                    ),*/
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: new CheckboxProgress(
                                  starCount : widget.project.milestoneCount,
                                  rating: widget.project.milestoneCompleteCount.toDouble(),
                                  //onRatingChanged: (rating) => setState(() => this.ratingx = rating),
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
                          child: new IconButton(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.blue,
                              size: 40,
                            ),
                            onPressed: () {
                              widget._foldingCellKey?.currentState?.toggleFold();
                            },
                          ),

                        ),
                      ),
                    ],
                  ),

                  onTap: () {
                    widget._foldingCellKey?.currentState?.toggleFold();
                  },
                ),
              ),
            ),

            /*  Text("CARD",
                style: TextStyle(
                    color: Color(0xFF2e282a),
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800)),
            FlatButton(
              onPressed: () => widget._foldingCellKey?.currentState?.toggleFold(),
              child: Text(
                "Open",
              ),
              textColor: Colors.white,
              color: Colors.indigoAccent,
              splashColor: Colors.white.withOpacity(0.5),
            )*/
          ],
        ));
  }

  Widget _buildInnerBottomWidget() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(20, 2, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                for(var item in widget.project.projectImages)
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Image.network(
                      item,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,),
                  ),
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 2, 20, 0),
            child: Text(
              widget.project.description,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 10.0,
                fontWeight: FontWeight.w300,
                fontFamily: "OpenSans",
              ),
            ),
          ),
        ],
      ),

    );
  }

  //Objectives
  Widget _buildFrontObjectiveWidget(Milestones milestones) {
    Icon icon;
    if (milestones.completed) {
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

    return
      Builder(
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
              //alignment: Alignment.center,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    elevation: 3,
                    child: Container(
                      key: ValueKey(milestones.id),
                      height: 70.0,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: ListTile(
                        //Card Icon
                        leading:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                          child: icon
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        //Card Content
                        subtitle :  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Container(
                                              child:  Text(
                                                milestones.title,
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
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                                child: new LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 240,
                                  animation: true,
                                  lineHeight: 10.0,
                                  animationDuration: 2000,
                                  percent: 0.9,
                                  center: Text(
                                    "90%",
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
                        //Card End
                        trailing:  Column(
                         //mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Container(
                                child: new IconButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    SimpleFoldingCellState foldingCellState =
                                    context.ancestorStateOfType(
                                        TypeMatcher<SimpleFoldingCellState>());
                                    foldingCellState?.toggleFold();
                                  },
                                ),

                              ),
                            ),
                          ],
                        ),

                        onTap: () {
                          SimpleFoldingCellState foldingCellState =
                          context.ancestorStateOfType(
                              TypeMatcher<SimpleFoldingCellState>());
                          foldingCellState?.toggleFold();
                        },

                      ),
                    ),
                  ),

                  /*  Text("CARD",
                      style: TextStyle(
                          color: Color(0xFF2e282a),
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800)),
                  FlatButton(
                    onPressed: () => widget._foldingCellKey?.currentState?.toggleFold(),
                    child: Text(
                      "Open",
                    ),
                    textColor: Colors.white,
                    color: Colors.indigoAccent,
                    splashColor: Colors.white.withOpacity(0.5),
                  )*/
                ],
              ));
        });
  }

  Widget _buildInnerTopObjectiveWidget(Milestones milestones) {
    Icon icon;
    if (milestones.completed) {
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
    return
      Builder(
          builder: (BuildContext context) {
            return Container(
                color: Colors.white,
                //alignment: Alignment.center,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Card(
                      elevation: 3,
                      child: Container(
                        key: ValueKey(milestones.id),
                        height: 70.0,
                        margin: const EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          //Card Icon
                          leading:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Container(
                                            child: icon
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          //Card Content
                          subtitle :  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Container(
                                              child:  Text(
                                                milestones.title,
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
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 7, 0, 0),
                                child: new CheckboxProgress(
                                  starCount : widget.project.milestoneCount,
                                  rating: widget.project.milestoneCompleteCount.toDouble(),
                                  //onRatingChanged: (rating) => setState(() => this.ratingx = rating),
                                ),
                              ),
                            ],
                          ),
                          //Card End
                          trailing:  Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              //
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Container(
                                  child: new IconButton(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      SimpleFoldingCellState foldingCellState =
                                      context.ancestorStateOfType(
                                          TypeMatcher<SimpleFoldingCellState>());
                                      foldingCellState?.toggleFold();
                                    },
                                  ),

                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            SimpleFoldingCellState foldingCellState =
                            context.ancestorStateOfType(
                                TypeMatcher<SimpleFoldingCellState>());
                            foldingCellState?.toggleFold();
                          },

                        ),
                      ),
                    ),
                  ],
                ));
          });
  }

  Widget _buildInnerBottomObjectiveWidget(Milestones milestones) {

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                for(var item in milestones.milestonesImages)
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Image.network(
                      item,
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,),
                  ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.fromLTRB(0, 10, 10, 0),
                child:
                new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerObjectives(
                            milestones : milestones,
                          )),
                    );
                  },
                  child: new Padding(
                    padding: new EdgeInsets.all(0.0),
                    child: new  Text("View Objectives",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: "OpenSans",
                      ),
                      textAlign: TextAlign.end,

                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}

