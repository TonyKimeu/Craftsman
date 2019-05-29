import 'package:cloud_firestore/cloud_firestore.dart';

class Objectives {
  final String title,assignedName,assignedPic;
  final int id, milestoneId;
  final bool completed;
  final DocumentReference reference;


  Objectives(this.title, this.assignedName, this.assignedPic, this.id,
      this.milestoneId, this.completed,
      this.reference);

  Objectives.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['title'] != null),
        assert(map['assignedName'] != null),
        assert(map['assignedPic'] != null),
        assert(map['completed'] != null),
        id = map['id'],
        milestoneId = map['milestoneId'],
        title = map['title'],
        assignedName = map['assignedName'],
        assignedPic = map['assignedPic'],
        completed = map['completed'];


  Objectives.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$id:$title:$milestoneId:$assignedName:$completed>";


}
